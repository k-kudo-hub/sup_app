class Genre < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '骨折' },
    { id: 2, name: '捻挫・脱臼' },
    { id: 3, name: '打撲' },
    { id: 4, name: '切傷・擦過傷' },
    { id: 5, name: 'やけど' },
    { id: 6, name: 'その他の外傷' },
    { id: 7, name: '誤食' },
    { id: 8, name: '誤嚥・誤飲' },
    { id: 9, name: '誤薬' },
    { id: 10, name: '落薬' },
    { id: 11, name: '食中毒' },
    { id: 12, name: '感染症' },
    { id: 13, name: '結核' },
    { id: 14, name: '疥癬' },
    { id: 15, name: '自傷行為' },
    { id: 16, name: '利用者間のトラブル' },
    { id: 17, name: '無断外出' },
    { id: 18, name: '暴力行為' },
    { id: 19, name: 'その他' }
  ]
end
