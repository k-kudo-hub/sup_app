class Carry < ActiveHash::Base
  self.data = [
    { id: 1, name: '未実施' },
    { id: 2, name: '実施' },
    { id: 3, name: '非実施' }
  ]
end
