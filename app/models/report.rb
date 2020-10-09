class Report < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :place
    belongs_to_active_hash :genre
    belongs_to_active_hash :re
    belongs_to_active_hash :level
    belongs_to_active_hash :contact
    belongs_to_active_hash :check

    belongs_to :client

    with_options presence: {message: "が入力されていません。"} do
      validates :client_id
      validates :user_id
      validates :occ_time
      validates :place_id, :res_id, :level_id,
      numericality: { other_than: 1 , message: "が選択されていません。"}
      validates :genre_id, 
      numericality: { other_than: 0 , message: "が選択されていません。"}
    end

    validate :check_one

    def check_one
      if (check_id == 1) && (content == "")
        errors.add(:content, "は本人承認に必要な項目です。")
      elsif (check_id == 1) && (coping == "")
        errors.add(:coping, "は本人承認に必要な項目です。")
      end
    end

end
