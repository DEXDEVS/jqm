<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\StdAttendance;

/**
 * StdAttendanceSearch represents the model behind the search form about `common\models\StdAttendance`.
 */
class StdAttendanceSearch extends StdAttendance
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['std_attend_id', 'user_id', 'class_name_id', 'std_id', 'created_by', 'updated_by'], 'integer'],
            [['date', 'attendance', 'created_at', 'updated_at'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = StdAttendance::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'std_attend_id' => $this->std_attend_id,
            'user_id' => $this->user_id,
            'class_name_id' => $this->class_name_id,
            'date' => $this->date,
            'std_id' => $this->std_id,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'attendance', $this->attendance]);

        return $dataProvider;
    }
}
