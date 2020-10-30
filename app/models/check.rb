class Check < ActiveHash::Base
  self.data = [
    { id: 0, name: '下書き' },
    { id: 1, name: '本人確認済み' },
    { id: 2, name: '看護師確認済み' },
    { id: 3, name: '主任以上確認済み' },
    { id: 4, name: 'ケアマネージャー確認済み' },
    { id: 5, name: '施設責任者確認済み' },
    { id: 6, name: '報告済み' }
  ]
end
