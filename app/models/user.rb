class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :picture, PictureUploader

  with_options presence: { message: 'が空です。' } do
    validates :name
    validates :name_kana,    format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナのみ登録できます。' }
    validates :staff_number, format: { with: /\A[0-9]+\z/, message: 'は数字のみ登録できます。' }
    validates :password, :password_confirmation,
              format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i, message: 'は8文字以上の半角英数字混合で登録できます。' }
  end
  validates :qualification_id, :work_style_id,
            numericality: { other_than: 1, message: 'が選択されていません' }

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages

  has_many :relationships
  has_many :clients, through: :relationships

  def position
    case self.position_id
      when 1 then
        return "役職なし・派遣"
      when 2 then
        return "一般"
      when 3 then
        return "副主任"
      when 4 then
        return "主任"
      when 5 then
        return "係長"
      when 6 then
        return "課長代理"
      when 7 then
        return "課長"
    end
  end

  def qualification
    case self.qualification_id
      when 2 then
        return "保有資格なし"
      when 3 then
        return "介護職員初任者研修"
      when 4 then
        return "介護福祉士実務者研修"
      when 5 then
        return "介護福祉士"
      when 6 then
        return "認定介護福祉士"
      when 7 then
        return "ケアマネージャー"
      when 8 then
        return "社会福祉士"
      when 9 then
        return "理学療法士"
      when 10 then
        return "作業療法士"
      when 11 then
        return "看護師"
    end
  end

  def work_style
    case self.work_style_id
      when 2 then
       return "常勤"
      when 3 then
       return "非常勤"
    end
  end
  
  def no_image?
    self.picture.file.nil?
  end

  def is_qualified?
    [5,6,7,11].include?(self.qualification_id)
  end

  def is_talker?
    self.position_id > 3
  end

  def is_subtop?
    self.position_id > 5
  end

  def is_top?
    self.position_id > 6
  end

  def can_edit?
    self.is_qualified? || self.is_talker?
  end

end
