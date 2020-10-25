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
    validate :check_two
    validate :check_three
    validate :check_four
    validate :check_five

    def check_one
      if (check_id == 1) && (content == "")
        errors.add(:content, "は本人承認に必要な項目です。")
      end
      if (check_id == 1) && (coping == "")
        errors.add(:coping, "は本人承認に必要な項目です。")
      end
    end
    
    def check_two
      if (check_id == 2) && (content == "")
        errors.add(:content, "は本人承認時に必要な項目です。")
      end
      if (check_id == 2) && (coping == "")
        errors.add(:coping, "は本人承認時に必要な項目です。")
      end
    end

    def check_three
      if (check_id == 3) && (content == "")
        errors.add(:content, "は本人承認時に必要な項目です。")
      end
      if (check_id == 3) && (coping == "")
        errors.add(:coping, "は本人承認時に必要な項目です。")
      end
      if (check_id == 3) && (count_content == "")
        errors.add(:count_content, "は現場責任者承認に必要な項目です")
      end
    end

    def check_four
      if (check_id == 4) && (content == "")
        errors.add(:content, "は本人承認時に必要な項目です。")
      end
      if (check_id == 4) && (coping == "")
        errors.add(:coping, "は本人承認時に必要な項目です。")
      end
      if (check_id == 4) && (desc_content == "")
        errors.add(:desc_content, "はケアマネージャー承認に必要な項目です")
      end
      if (check_id == 4) && (desc_date > Date.today )
        errors.add(:desc_date, "は未来の日時を設定することはできません")
      end
    end

    def check_five
      if (check_id == 5) && (content == "")
        errors.add(:content, "は本人承認時に必要な項目です。")
      end
      if (check_id == 5) && (coping == "")
        errors.add(:coping, "は本人承認時に必要な項目です。")
      end
      if (check_id == 5) && (desc_content == "")
        errors.add(:desc_content, "はケアマネージャー承認時に必要な項目です")
      end 
      if (check_id == 5) && (count_content == "")
        errors.add(:count_content, "は施設責任者承認に必要な項目です")
      end
      if (check_id == 5) && (desc_date > Date.today )
        errors.add(:desc_date, "は未来の日時を設定することはできません")
      end
    end

end
