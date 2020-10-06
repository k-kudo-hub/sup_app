class Shape < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '水状便' },
    { id: 2, name: '泥状便' },
    { id: 3, name: '軟便' },
    { id: 4, name: '普通便' },
    { id: 5, name: '硬便' }
  ] 
end
