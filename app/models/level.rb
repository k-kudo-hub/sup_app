class Level < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '異常なし' },
    { id: 3, name: '要経過観察' },
    { id: 4, name: '要医療機関受診' },
    { id: 5, name: '要外来治療' },
    { id: 6, name: '要入院治療' },
    { id: 7, name: '死亡' },
    { id: 8, name: 'その他' }
  ] 
end
