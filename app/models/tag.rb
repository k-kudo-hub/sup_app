class Tag < ActiveHash::Base
  self.data = [
    { id: 1, name: '共有' },
    { id: 2, name: '注意' },
    { id: 3, name: '重要' }
  ]
end
