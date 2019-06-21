<?php

namespace backend\controllers;

use Yii;
use yii\helpers\Html;
use common\models\StdRegistration;
use common\models\StdRegistrationSearch;
use common\models\StdAcademicInfo;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use \yii\web\Response;
use yii\web\UploadedFile;
use yii\filters\AccessControl;
use yii\db\Connection;


/**
 * StdRegistrationController implements the CRUD actions for StdRegistration model.
 */
class StdRegistrationController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['login', 'error'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['logout', 'index', 'create', 'view', 'update', 'delete', 'bulk-delete','fetch-fee','student-details','std-photo','form', 'take-webcam-photo'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all StdRegistration models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new StdRegistrationSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

     public function beforeAction($action) {
        $this->enableCsrfValidation = false;
        return parent::beforeAction($action);
    }

    /**
     * Displays a single StdRegistration model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new StdRegistration model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $request = Yii::$app->request;
        $model = new StdRegistration();
        $stdAcademicInfo = new StdAcademicInfo();
        $conn = \Yii::$app->db;
        $y = date('y');
        global $prntPassword, $stdPassword;
    
        if ($model->load($request->post())) {
                $transection = $conn->beginTransaction();
                try{
                    $branch_id = Yii::$app->user->identity->branch_id;
                    $model->branch_id = $branch_id;

                    $model->std_photo = UploadedFile::getInstance($model,'std_photo');
                    if(!empty($model->std_photo)){
                        $imageName = $model->std_name.'_photo'; 
                        $model->std_photo->saveAs('uploads/'.$imageName.'.'.$model->std_photo->extension);
                        //save the path in the db column
                        $model->std_photo = 'uploads/'.$imageName.'.'.$model->std_photo->extension;
                    } else {
                       $model->std_photo = 'uploads/'.'std_default.jpg'; 
                    }
                    $model->status     = "Active";
                    $model->academic_status = "Active";
                    $model->created_by = Yii::$app->user->identity->id; 
                    $model->created_at = new \yii\db\Expression('NOW()');
                    $model->updated_by = '0'; 
                    $model->updated_at = '0';
                    $model->save();

                    // update std_reg_no....
                    $stdID = StdRegistration::find()->max('std_id');
                    $std_reg_no = "STD-REG-Y".$y."-0".$stdID;
                    $std_registration = Yii::$app->db->createCommand()->update('std_personal_info', [
                        'std_reg_no' => $std_reg_no],
                        ['std_id' => $stdID]
                    )->execute();

                    // stdAcademicInfo...
                    $stdAcademicInfo->std_id = $model->std_id;
                    $stdAcademicInfo->class_name_id = $model->class_id;
                    $stdAcademicInfo->std_enroll_status = 'unsign'; 
                    $stdAcademicInfo->created_by = Yii::$app->user->identity->id; 
                    $stdAcademicInfo->created_at = new \yii\db\Expression('NOW()');
                    $stdAcademicInfo->updated_by = '0'; 
                    $stdAcademicInfo->updated_at = '0';
                    $stdAcademicInfo->save();
                    
                    $transection->commit();
                    Yii::$app->session->setFlash('success', "Student Registered Successfully!");
                    return $this->redirect(['std-personal-info/index']);

                } catch(Exception $e) {
                    $transection->rollback();
                    Yii::$app->session->setFlash('error', "Student Registration Failed, Try Again...!");
                }
        }
        return $this->render('create', [
            'model' => $model,            
            'stdAcademicInfo' => $stdAcademicInfo,
        ]);
    }

    /**
     * Updates an existing StdRegistration model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post())) {
        	$model->updated_by = Yii::$app->user->identity->id;
            $model->updated_at = new \yii\db\Expression('NOW()');
            $model->created_by = $model->created_by;
            $model->created_at = $model->created_at;
            $model->save();
            return $this->redirect(['view', 'id' => $model->std_id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing StdRegistration model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    public function actionFetchFee()
    {   
        return $this->render('fetch-fee');
    }

    public function actionTakeWebcamPhoto()
    {   
        return $this->render('take-webcam-photo');
    }

    /**
     * Finds the StdRegistration model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StdRegistration the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StdRegistration::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
