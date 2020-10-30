class Place < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '居室（フロア）' },
    { id: 3, name: '居室（トイレ）' },
    { id: 4, name: '居室（キッチン）' },
    { id: 5, name: '廊下' },
    { id: 6, name: 'リビング' },
    { id: 7, name: '共用トイレ' },
    { id: 8, name: '浴室' },
    { id: 9, name: '脱衣所' },
    { id: 10, name: 'エレベーター' },
    { id: 11, name: '階段' },
    { id: 12, name: 'エントランス' },
    { id: 13, name: 'ロビー' },
    { id: 14, name: 'ベランダ' },
    { id: 15, name: 'スタッフルーム' },
    { id: 16, name: 'マシンルーム' },
    { id: 17, name: '健康管理室' },
    { id: 18, name: '外出先' },
    { id: 19, name: 'その他' }
  ]
end
