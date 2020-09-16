class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: {message: "が空です"} do
    validates :name
    validates :name_kana
    validates :staff_number,  numericality:{with: /\A[0-9]+\z/, message: "は半角数字のみ使用できます"}
    validates :password,      numericality:{with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i, message:"は半角英数字混合、8桁以上で登録できます"}
    validates :position_id, :qualification_id, :work_style_id,
                              numericality:{ other_than: 1 , message: "が選択されていません"}
  end

# No use email
 def email_required?
   false
 end

 def email_changed?
   false
 end

end
