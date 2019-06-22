<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "std_personal_info".
 *
 * @property int $std_id
 * @property string $std_reg_no
 * @property string $std_name
 * @property string $std_contact_no
 * @property string $std_father_name
 * @property string $std_father_contact_no
 * @property string $std_father_cnic
 * @property string $std_DOB
 * @property string $std_gender
 * @property string $std_permanent_address
 * @property string $std_temporary_address
 * @property string $std_email
 * @property string $std_photo
 * @property string $std_b_form
 * @property string $std_district
 * @property string $std_religion
 * @property string $std_nationality
 * @property string $std_tehseel
 * @property string $status
 * @property string $academic_status
 * @property string $other_info
 * @property string $created_at
 * @property string $updated_at
 * @property int $created_by
 * @property int $updated_by
 * @property FeeTransactionHead[] $feeTransactionHeads
 * @property StdAcademicInfo[] $stdAcademicInfos
 * @property StdAttendance[] $stdAttendances
 * @property StdEnrollmentDetail[] $stdEnrollmentDetails
 * @property StdFeeDetails[] $stdFeeDetails
 * @property StdGuardianInfo[] $stdGuardianInfos
 * @property StdIceInfo[] $stdIceInfos
 */
class StdPersonalInfo extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'std_personal_info';
    }

    public $stdInquiryNo;
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['std_reg_no', 'std_name', 'std_father_name','std_father_contact_no', 'std_father_cnic', 'std_DOB', 'std_gender', 'std_residency', 'std_permanent_address', 'std_district', 'std_religion', 'std_nationality', 'std_tehseel', 'status', 'academic_status'], 'required'],
            [['branch_id', 'std_b_form', 'std_email', 'std_contact_no', 'std_DOB', 'created_at', 'updated_at','created_by', 'updated_by', 'std_temporary_address', 'barcode', 'std_other_info','class_id', 'std_leave_date', 'std_photo'], 'safe'],
            [['std_gender', 'status', 'academic_status'], 'string'],
            [['created_by', 'updated_by'], 'integer'],
            [['std_reg_no', 'std_name', 'std_father_name', 'std_district', 'std_religion', 'std_nationality', 'std_tehseel'], 'string', 'max' => 50],
            [['std_contact_no'], 'string', 'max' => 15],
            [['std_permanent_address', 'std_temporary_address', 'std_b_form'], 'string', 'max' => 255],
            [['std_email'], 'string', 'max' => 84],
            [['std_photo'], 'string', 'max' => 50000],
            ['std_email','email'],
            [['std_photo'], 'image', 'extensions' => 'jpg'],
            [['branch_id'], 'exist', 'skipOnError' => true, 'targetClass' => Branches::className(), 'targetAttribute' => ['branch_id' => 'branch_id']],
            [['class_id'], 'exist', 'skipOnError' => true, 'targetClass' => StdClassName::className(), 'targetAttribute' => ['class_id' => 'class_name_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'std_id' => 'ID',
            'std_reg_no' => 'Registration No',
            'std_name' => 'Student Name / طالب علم کا نام',
            'std_contact_no' => 'Student Contact No. / طالب علم کا رابطہ نمبر  ',
            'branch_id' => 'Branch Name / برانچ کا نام',
            'std_father_name' => 'Father / Guardian Name / وا لد / سرپرست کا نام  ',
            'std_father_contact_no' => 'Father / Guardian Contact No. / والد / سرپرست رابطہ نمبر ',
            'std_father_cnic' => 'Father / Guardian CNIC / وا لد / سرپرست کا سی این آئی سی ',
            'std_DOB' => 'DOB / تاریخ پیدائش',
            'std_gender' => 'Gender / جنس',
            'std_residency' => 'Student Residency / طالب علم کی رہائش گاہ ',
            'std_permanent_address' => 'Permanent Address / مستقل پتہ',
            'std_temporary_address' => 'Temporary Address / عارضی پتہ',
            'std_email' => 'Email / ای میل',
            'std_photo' => 'Photo / تصویر',
            'std_b_form' => 'B-Form / بی فارم',
            'std_district' => 'District / ضلع',
            'class_id' => 'Class / کلا س ',
            'std_religion' => 'Caste / ذات ',
            'std_leave_date' => 'Leave Date / ',
            'std_nationality' => 'Nationality / قومیت',
            'std_tehseel' => 'Tehseel / تحصیل',
            'status' => 'Status / حالت',
            'academic_status' => 'Academic Status / تعلیمی حیثیت',
            'std_other_info' => 'Student Other Info /   طالب علم کی دیگر معلومات ',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFeeTransactionHeads()
    {
        return $this->hasMany(FeeTransactionHead::className(), ['std_id' => 'std_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStdAcademicInfos()
    {
        return $this->hasMany(StdAcademicInfo::className(), ['std_id' => 'std_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStdAttendances()
    {
        return $this->hasMany(StdAttendance::className(), ['student_id' => 'std_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStdEnrollmentDetails()
    {
        return $this->hasMany(StdEnrollmentDetail::className(), ['std_enroll_detail_std_id' => 'std_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStdFeeDetails()
    {
        return $this->hasMany(StdFeeDetails::className(), ['std_id' => 'std_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStdGuardianInfos()
    {
        return $this->hasMany(StdGuardianInfo::className(), ['std_id' => 'std_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStdIceInfos()
    {
        return $this->hasMany(StdIceInfo::className(), ['std_id' => 'std_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBranch()
    {
        return $this->hasOne(Branches::className(), ['branch_id' => 'branch_id']);
    }

    public function getClass()
    {
        return $this->hasOne(StdClassName::className(), ['class_name_id' => 'class_id']);
    }

    public function getPhotoInfo(){
        $path = Url::to('@web/uploads/');
        $url = Url::to('@web/uploads/');
        $filename = $this->std_name.'_photo'.'.jpg';
        $alt = $this->std_name."'s image not exist!";

        $imageInfo = ['alt'=>$alt];

        if(file_exists($path.$filename)){
            $imageInfo['url'] = $url.'default.jpg';
        }  else {
            $imageInfo['url'] = $url.$filename; 
        }
        return $imageInfo;
    }
}
