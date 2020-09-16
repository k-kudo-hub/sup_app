class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: {message: "が空です。"} do
    validates :name
    validates :name_kana,    format:{with:/\A[ァ-ヶー－]+\z/, message:"は全角カタカナのみ登録できます。"}
    validates :staff_number, format:{with: /\A[0-9]+\z/, message:"は数字のみ登録できます。"}
    validates :password, :password_confirmation,  
                             format:{with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i, message: "は8文字以上の半角英数字混合で登録できます。"}    
  end
   validates :position_id, :qualification_id, :work_style_id,
                             numericality:{ other_than: 1 , message: "が選択されていません"}
end
