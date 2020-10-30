class Re < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '介助中' },
    { id: 3, name: 'お客様単独' },
    { id: 4, name: 'お客様同士' }
  ]
end
