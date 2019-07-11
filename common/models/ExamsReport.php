<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "exams_report".
 *
 * @property int $id
 * @property int $class_id
 * @property int $std_id
 * @property int $para_id
 * @property int $course_id
 * @property string $start_date
 * @property string $end_date
 * @property string $duration
 * @property string $remarks
 * @property string $created_at
 * @property string $updated_at
 * @property int $created_by
 * @property int $updated_by
 *
 * @property StdClassName $class
 * @property StdPersonalInfo $std
 * @property Paraay $para
 */
class ExamsReport extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'exams_report';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['class_id', 'std_id', 'para_id','start_date', 'course_id'], 'required'],
            [['class_id', 'std_id', 'para_id', 'course_id', 'created_by', 'updated_by'], 'integer'],
            [['duration','end_date', 'created_at', 'updated_at', 'remarks', 'created_by', 'updated_by'], 'safe'],
            [['remarks'], 'string'],
            [['duration'], 'string', 'max' => 100],
            [['class_id'], 'exist', 'skipOnError' => true, 'targetClass' => StdClassName::className(), 'targetAttribute' => ['class_id' => 'class_name_id']],
            [['std_id'], 'exist', 'skipOnError' => true, 'targetClass' => StdPersonalInfo::className(), 'targetAttribute' => ['std_id' => 'std_id']],
            [['para_id'], 'exist', 'skipOnError' => true, 'targetClass' => Paraay::className(), 'targetAttribute' => ['para_id' => 'id']],
            [['course_id'], 'exist', 'skipOnError' => true, 'targetClass' => StdCourse::className(), 'targetAttribute' => ['course_id' => 'course_id']], 
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'class_id' => 'Class',
            'std_id' => 'Student',
            'para_id' => 'Para',
            'course_id' => 'Course',
            'start_date' => 'Start Date',
            'end_date' => 'End Date',
            'duration' => 'Duration',
            'remarks' => 'Remarks',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getClass()
    {
        return $this->hasOne(StdClassName::className(), ['class_name_id' => 'class_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStd()
    {
        return $this->hasOne(StdPersonalInfo::className(), ['std_id' => 'std_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPara()
    {
        return $this->hasOne(Paraay::className(), ['id' => 'para_id']);
    }

   /** 
    * @return \yii\db\ActiveQuery 
    */ 
   public function getStdCourse() 
   { 
       return $this->hasOne(StdCourse::className(), ['course_id' => 'course_id']); 
   } 
}
