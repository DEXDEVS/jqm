<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "std_attendance".
 *
 * @property int $std_attend_id
 * @property int $user_id
 * @property int $class_name_id
 * @property string $date
 * @property int $std_id
 * @property string $attendance
 * @property int $created_by
 * @property int $updated_by
 * @property string $created_at
 * @property string $updated_at
 *
 * @property StdClassName $className
 * @property StdPersonalInfo $std
 */
class StdAttendance extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'std_attendance';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id', 'class_name_id', 'date', 'std_id', 'attendance', 'created_by', 'updated_by'], 'required'],
            [['user_id', 'class_name_id', 'std_id', 'created_by', 'updated_by'], 'integer'],
            [['date', 'created_at', 'updated_at'], 'safe'],
            [['attendance'], 'string', 'max' => 2],
            [['class_name_id'], 'exist', 'skipOnError' => true, 'targetClass' => StdClassName::className(), 'targetAttribute' => ['class_name_id' => 'class_name_id']],
            [['std_id'], 'exist', 'skipOnError' => true, 'targetClass' => StdPersonalInfo::className(), 'targetAttribute' => ['std_id' => 'std_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'std_attend_id' => 'Std Attend ID',
            'user_id' => 'User ID',
            'class_name_id' => 'Class Name ID',
            'date' => 'Date',
            'std_id' => 'Std ID',
            'attendance' => 'Attendance',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getClassName()
    {
        return $this->hasOne(StdClassName::className(), ['class_name_id' => 'class_name_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStd()
    {
        return $this->hasOne(StdPersonalInfo::className(), ['std_id' => 'std_id']);
    }
}
