class Main < ActiveHash::Base

  self.data = [
    { id: 1, name: '--' },
    
    { id: 2, name: '排泄介助' },{ id: 3, name: '食事介助' },{ id: 4, name: '入浴介助' },
    { id: 5, name: '移動介助' },{ id: 6, name: '整容介助' },{ id: 7, name: '口腔介助' },
    { id: 8, name: '起床・就寝介助' },{ id: 9, name: '服薬介助' },{ id: 10, name: '測定' },
    { id: 11, name: 'その他の介助' },
    
    { id: 12, name: '外傷処置' },{ id: 13, name: '服薬管理' },{ id: 14, name: 'バルーン交換' },
    { id: 15, name: '排泄処置' },{ id: 16, name: '酸素吸入' },{ id: 17, name: '注射' },
    { id: 18, name: '血糖チェック' },{ id: 19, name: '精神的ケア' },{ id: 20, name: '栄養管理' },
    { id: 21, name: 'その他の看護' },
    
    { id: 22, name: '清掃' },{ id: 23, name: '洗濯' },{ id: 24, name: '寝具' },
    { id: 25, name: '衣類' },{ id: 26, name: '調理' },{ id: 27, name: '買い物' },
    { id: 28, name: 'その他生活援助' },
    
    { id: 29, name: '呼吸リハビリ' },{ id: 30, name: '嚥下リハビリ' },
    { id: 31, name: '筋力維持・向上' },{ id: 32, name: '関節可動域維持・拡大' },{ id: 33, name: '機能評価' },
    { id: 34, name: 'その他のリハビリ' },

    { id: 35, name: '余暇活動' }
  ] 
end

