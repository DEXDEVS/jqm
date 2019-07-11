<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\ExamsReport;

/**
 * ExamsReportSearch represents the model behind the search form about `common\models\ExamsReport`.
 */
class ExamsReportSearch extends ExamsReport
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id','created_by', 'updated_by'], 'integer'],
            [[ 'class_id', 'std_id', 'para_id', 'course_id','start_date', 'end_date', 'duration', 'remarks', 'created_at', 'updated_at'], 'safe'],
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
        $query = ExamsReport::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }
        $query->joinWith('class');
        $query->joinWith('std');
        $query->joinWith('para');
        $query->joinWith('stdCourse');
        $query->andFilterWhere([
            'id' => $this->id,
            // 'class_id' => $this->class_id,
            // 'std_id' => $this->std_id,
            // 'para_id' => $this->para_id,
            'start_date' => $this->start_date,
            'end_date' => $this->end_date,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
        ]);

        $query->andFilterWhere(['like', 'duration', $this->duration])
            ->andFilterWhere(['like', 'remarks', $this->remarks])
            ->andFilterWhere(['like', 'std_class_name.class_name', $this->class_id])
            ->andFilterWhere(['like', 'std_personal_info.std_name', $this->std_id])
            ->andFilterWhere(['like', 'paraay.name', $this->para_id])
            ->andFilterWhere(['like', 'std_course.course_name', $this->course_id]);

        return $dataProvider;
    }
}
