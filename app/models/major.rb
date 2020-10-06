class Major < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '身体介助' },
    { id: 3, name: '生活援助' },
    { id: 4, name: '看護・処置' },
    { id: 5, name: 'リハビリテーション' },
  ] 
end
