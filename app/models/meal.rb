class Meal < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '10' },
    { id: 2, name: '9' },
    { id: 3, name: '8' },
    { id: 4, name: '7' },
    { id: 5, name: '6' },
    { id: 6, name: '5' },
    { id: 7, name: '4' },
    { id: 8, name: '3' },
    { id: 9, name: '2' },
    { id: 10, name: '1' },
    { id: 11, name: '0' },
    { id: 12, name: '欠食' }
  ] 
end
