<?php

namespace backend\controllers;

use Yii;
use common\models\ExamsReport;
use common\models\ExamsReportSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use \yii\web\Response;
use yii\helpers\Html;
use yii\helpers\Json;

/**
 * ExamsReportController implements the CRUD actions for ExamsReport model.
 */
class ExamsReportController extends Controller
{
    /**
     * @inheritdoc
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
                        'actions' => ['logout', 'index', 'create', 'view', 'update', 'delete', 'bulk-delete','fetch-days-count','get-record'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['post'],
                    'bulk-delete' => ['post'],
                ],
            ],
        ];
    }

    /**
     * Lists all ExamsReport models.
     * @return mixed
     */

    public function actionFetchDaysCount()
    { 
        return $this->render('fetch-days-count');
    }

    public function actionGetRecord($course, $paraa, $stdId){
        // fine record of students not duplicate
        $student = ExamsReport::find()
                ->select(['std_id'])
                ->where(['para_id' => $paraa, 'course_id'=> $course, 'std_id' => $stdId])
                ->all();
        echo Json::encode($student); 
    }

    public function actionIndex()
    {    
        $searchModel = new ExamsReportSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }


    /**
     * Displays a single ExamsReport model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {   
        $request = Yii::$app->request;
        if($request->isAjax){
            Yii::$app->response->format = Response::FORMAT_JSON;
            return [
                    'title'=> "ExamsReport #".$id,
                    'content'=>$this->renderAjax('view', [
                        'model' => $this->findModel($id),
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                            Html::a('Edit',['update','id'=>$id],['class'=>'btn btn-primary','role'=>'modal-remote'])
                ];    
        }else{
            return $this->render('view', [
                'model' => $this->findModel($id),
            ]);
        }
    }

    /**
     * Creates a new ExamsReport model.
     * For ajax request will return json object
     * and for non-ajax request if creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $request = Yii::$app->request;
        $model = new ExamsReport();  

        if($request->isAjax){
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            if($request->isGet){
                return [
                    'title'=> "Create new ExamsReport",
                    'content'=>$this->renderAjax('create', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-primary','type'=>"submit"])
        
                ];         
            }else if($model->load($request->post()) && $model->validate()){
                $transaction = \Yii::$app->db->beginTransaction();
                try {
                    $model->created_by = Yii::$app->user->identity->id; 
                    $model->created_at = new \yii\db\Expression('NOW()');
                    $model->updated_by = '0';
                    $model->updated_at = '0'; 
                    $model->save();

                    $transaction->commit();
                    Yii::$app->session->setFlash('success', "You have Successfully Create Student Exams Report...!");
                } catch (Exception $e) {
                    $transaction->rollBack();
                    Yii::$app->session->setFlash('error', "Transaction Failed, Try Again...!");
                }
                return [
                    'forceReload'=>'#crud-datatable-pjax',
                    'title'=> "Create new ExamsReport",
                    'content'=>'<span class="text-success">Create ExamsReport success</span>',
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                            Html::a('Create More',['create'],['class'=>'btn btn-primary','role'=>'modal-remote'])
        
                ];         
            }else{           
                return [
                    'title'=> "Create new ExamsReport",
                    'content'=>$this->renderAjax('create', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-primary','type'=>"submit"])
        
                ];         
            }
        }else{
            /*
            *   Process for non-ajax request
            */
            if ($model->load($request->post()) && $model->save()) {
                return $this->redirect(['./std-personal-info-view', 'id' => $model->std_id]);
            } else {
                return $this->render('create', [
                    'model' => $model,
                ]);
            }
        }
       
    }

    /**
     * Updates an existing ExamsReport model.
     * For ajax request will return json object
     * and for non-ajax request if update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $request = Yii::$app->request;
        $model = $this->findModel($id);       

        if($request->isAjax){
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            if($request->isGet){
                return [
                    'title'=> "Update ExamsReport #".$id,
                    'content'=>$this->renderAjax('update', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-primary','type'=>"submit"])
                ];         
            }else if($model->load($request->post()) && $model->validate()){
                 $transaction = \Yii::$app->db->beginTransaction();
                try {
                    
                    $model->updated_by = Yii::$app->user->identity->id;
                    $model->updated_at = new \yii\db\Expression('NOW()');
                    $model->created_by = $model->created_by;
                    $model->created_at = $model->created_at;
                    $model->save();

                $transaction->commit();
                    Yii::$app->session->setFlash('warning', "You have Successfully Update Student Exams Report...!");
                } catch (Exception $e) {
                    $transaction->rollBack();
                    Yii::$app->session->setFlash('error', "Transaction Failed, Try Again...!");
                }
                return [
                    'forceReload'=>'#crud-datatable-pjax',
                    'title'=> "ExamsReport #".$id,
                    'content'=>$this->renderAjax('view', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                            Html::a('Edit',['update','id'=>$id],['class'=>'btn btn-primary','role'=>'modal-remote'])
                ];    
            }else{
                 return [
                    'title'=> "Update ExamsReport #".$id,
                    'content'=>$this->renderAjax('update', [
                        'model' => $model,
                    ]),
                    'footer'=> Html::button('Close',['class'=>'btn btn-default pull-left','data-dismiss'=>"modal"]).
                                Html::button('Save',['class'=>'btn btn-primary','type'=>"submit"])
                ];        
            }
        }else{
            /*
            *   Process for non-ajax request
            */
            if ($model->load($request->post()) && $model->save()) {
                $transaction = \Yii::$app->db->beginTransaction();
                try {
                    
                    $stdPersonalInfo = Yii::$app->db->createCommand("SELECT p.std_name, p.std_father_contact_no, e.* 
                        FROM std_personal_info as p
                        INNER JOIN exams_report as e
                        ON e.std_id = p.std_id
                        WHERE p.std_id = '$model->std_id'
                        AND e.class_id = '$model->class_id'
                        AND e.course_id = '$model->course_id'
                        AND e.para_id = '$model->para_id'")->queryAll();

                    $std_name = $stdPersonalInfo[0]['std_name'];
                    $contact = $stdPersonalInfo[0]['std_father_contact_no'];
                    $paraaId = $stdPersonalInfo[0]['para_id'];
                    $start_date = $stdPersonalInfo[0]['start_date'];
                    $end_date = $stdPersonalInfo[0]['end_date'];
                    $duration = $stdPersonalInfo[0]['duration'];

                    $para_name = Yii::$app->db->createCommand("SELECT name 
                        FROM paraay
                        WHERE id = '$paraaId'")->queryAll();
                    $paraaName = $para_name[0]['name'];

                    $num = str_replace('-', '', $contact);
                    $to = str_replace('+', '', $num);

                    $examSMS = Yii::$app->db->createCommand("SELECT sms_template FROM sms WHERE sms_name = 'Exam SMS'")->queryAll();
                    $examMsg = $examSMS[0]['sms_template'];
                    $msg = substr($examMsg,0,69);
                    $msg2 = substr($examMsg,69,14);
                    $msg3 = substr($examMsg,89,14);
                    $msg4 = substr($examMsg,124,37);
                    $msg5 = substr($examMsg,180,8);
                    $msg6 = substr($examMsg,192);
                    $message = $msg." ".$std_name." ".$msg2." ".$paraaName." ".$msg3." ".$start_date." ".$msg4." ".$end_date." ".$msg5." ".$duration." ".$msg6;
                    
                    $sms = SmsController::sendSMS($to, $message);
                        
                    $model->updated_by = Yii::$app->user->identity->id;
                    $model->updated_at = new \yii\db\Expression('NOW()');
                    $model->created_by = $model->created_by;
                    $model->created_at = $model->created_at;
                    $model->save();

                $transaction->commit();
                    Yii::$app->session->setFlash('warning', "You have Successfully Update Student Exams Report...!");
                } catch (Exception $e) {
                    $transaction->rollBack();
                    Yii::$app->session->setFlash('error', "Transaction Failed, Try Again...!");
                }
                return $this->redirect(['./std-personal-info-view', 'id' => $model->std_id]);
            } else {
                return $this->render('update', [
                    'model' => $model,
                ]);
            }
        }
    }

    /**
     * Delete an existing ExamsReport model.
     * For ajax request will return json object
     * and for non-ajax request if deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $request = Yii::$app->request;
        $this->findModel($id)->delete();

        if($request->isAjax){
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            return ['forceClose'=>true,'forceReload'=>'#crud-datatable-pjax'];
        }else{
            /*
            *   Process for non-ajax request
            */
            return $this->redirect(['index']);
        }


    }

     /**
     * Delete multiple existing ExamsReport model.
     * For ajax request will return json object
     * and for non-ajax request if deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionBulkDelete()
    {        
        $request = Yii::$app->request;
        $pks = explode(',', $request->post( 'pks' )); // Array or selected records primary keys
        foreach ( $pks as $pk ) {
            $model = $this->findModel($pk);
            $model->delete();
        }

        if($request->isAjax){
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            return ['forceClose'=>true,'forceReload'=>'#crud-datatable-pjax'];
        }else{
            /*
            *   Process for non-ajax request
            */
            return $this->redirect(['index']);
        }
       
    }

    /**
     * Finds the ExamsReport model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return ExamsReport the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = ExamsReport::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
