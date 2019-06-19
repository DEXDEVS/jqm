<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "std_personal_info".
 *
 * @property int $std_id
 * @property int $branch_id
 * @property string $std_reg_no
 * @property string $std_name
 * @property string $std_father_name
 * @property string $std_father_contact_no
 * @property string $std_father_cnic
 * @property string $std_contact_no
 * @property string $std_DOB
 * @property string $std_gender
 * @property string $std_residency
 * @property string $std_permanent_address
 * @property string $std_temporary_address
 * @property string $std_email
 * @property string $std_photo
 * @property string $std_b_form
 * @property int $class_id
 * @property string $std_district
 * @property string $std_religion
 * @property string $std_nationality
 * @property string $std_tehseel
 * @property string $std_password
 * @property string $status
 * @property string $std_admit_date
 * @property string $std_leave_date
 * @property string $academic_status
 * @property resource $barcode
 * @property string $std_other_info
 * @property string $created_at
 * @property string $updated_at
 * @property int $created_by
 * @property int $updated_by
 * @property int $delete_status
 *
 * @property Branches $branch
 * @property StdClassName $class
 */
class StdRegistration extends \yii\db\ActiveRecord
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
            [['branch_id', 'std_name', 'std_father_name', 'std_father_contact_no', 'std_father_cnic', 'std_DOB', 'std_gender', 'std_residency', 'std_permanent_address', 'std_district', 'std_religion', 'std_nationality', 'std_tehseel', 'status', 'std_admit_date', 'academic_status','class_id'], 'required'],
            [['branch_id', 'created_by', 'updated_by', 'delete_status'], 'integer'],
            [['std_DOB', 'std_admit_date', 'std_leave_date', 'std_contact_no', 'std_temporary_address', 'std_email', 'std_photo', 'std_b_form', 'std_leave_date', 'barcode', 'std_other_info', 'std_password', 'created_at', 'updated_at', 'created_by', 'updated_by'], 'safe'],
            [['std_gender', 'std_residency', 'status', 'academic_status', 'barcode', 'std_other_info'], 'string'],
            [['std_reg_no', 'std_name', 'std_district', 'std_tehseel'], 'string', 'max' => 50],
            [['std_father_name', 'std_religion', 'std_nationality'], 'string', 'max' => 100],
            [['std_father_contact_no', 'std_father_cnic', 'std_contact_no'], 'string', 'max' => 15],
            [['std_permanent_address', 'std_temporary_address', 'std_b_form'], 'string', 'max' => 255],
            [['std_email'], 'string', 'max' => 84],
            [['std_photo'], 'string', 'max' => 200],
            [['std_password'], 'string', 'max' => 20],
            [['std_reg_no'], 'unique'],
            [['branch_id'], 'exist', 'skipOnError' => true, 'targetClass' => Branches::className(), 'targetAttribute' => ['branch_id' => 'branch_id']],
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
            'class_id' => 'Class / کلا س ',
            'std_district' => 'District / ضلع',
            'std_religion' => 'Caste / ذات ',
            'std_nationality' => 'Nationality / قومیت',
            'std_tehseel' => 'Tehseel / تحصیل',
            'status' => 'Status / حالت',
            'std_admit_date' => 'Admission Date / طالب علم کی داخلہ  تاریخ ',
            'std_leave_date' => 'Leave Date /  ',
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
    public function getBranch()
    {
        return $this->hasOne(Branches::className(), ['branch_id' => 'branch_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
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
