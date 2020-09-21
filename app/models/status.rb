class Status < ActiveHash::Base 
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '入居' },
    { id: 3, name: '退居' },
    { id: 4, name: '入院' },
    { id: 5, name: 'その他' }
  ] 
end
