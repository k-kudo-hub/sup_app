class Amount < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '付着量' },
    { id: 2, name: '少量' },
    { id: 3, name: '普通量' },
    { id: 4, name: '多量' },
    { id: 5, name: '超多量' }
  ] 
end
