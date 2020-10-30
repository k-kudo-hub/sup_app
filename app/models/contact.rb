class Contact < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '看護職員' },
    { id: 3, name: '医師' },
    { id: 4, name: 'ケアマネージャー' },
    { id: 5, name: '施設長' },
    { id: 6, name: '家族' },
    { id: 7, name: 'その他' }
  ]
end
