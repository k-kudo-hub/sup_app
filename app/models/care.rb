class Care < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '自立' },
    { id: 3, name: '要見守り' },
    { id: 4, name: '一部介助' },
    { id: 5, name: '全介助' }
  ] 
end
