<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "phone_book".
 *
 * @property int $id
 * @property string $contact_person
 * @property string $phone_no
 * @property string $address
 * @property string $created_at
 * @property string $updated_at
 * @property int $created_by
 * @property int $updated_by
 */
class PhoneBook extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'phone_book';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['contact_person', 'phone_no'], 'required'],
            [['created_at', 'updated_at', 'address', 'created_by', 'updated_by'], 'safe'],
            [['created_by', 'updated_by'], 'integer'],
            [['contact_person'], 'string', 'max' => 32],
            [['phone_no'], 'string', 'max' => 15],
            [['address'], 'string', 'max' => 200],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'contact_person' => 'Contact Person',
            'phone_no' => 'Phone No',
            'address' => 'Address',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
        ];
    }
}
