class Cognition < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '自立' },
    { id: 3, name: 'MCI（もの忘れ程度）' },
    { id: 4, name: '軽度（生活にほぼ支障なし）' },
    { id: 5, name: '中等度（生活に支障あり）' },
    { id: 6, name: '重度（生活に重度の支障あり）' },
  ] 
end
