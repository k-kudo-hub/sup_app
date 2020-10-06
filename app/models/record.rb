class Record < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :major
    belongs_to_active_hash :main
    belongs_to_active_hash :sub
    belongs_to_active_hash :carry
    belongs_to_active_hash :shape
    belongs_to_active_hash :amount
    belongs_to_active_hash :meal


  belongs_to :client

  # with_options presence: {nessage: "が空です"} do
  #   validates :client,       uniqueness: { sccope: [:start_time, :end_time, :major_item_id, :main_item_id, :sub_item_id]}
  # end

  validate :time_check

  def time_check
    if (carryout_id == 2) && (start_time > Time.now)
      errors.add(:start_time, "未来の記録はできません")
    elsif (carryout_id == 2) && (end_time > Time.now)
      errors.add(:end_time, "未来の記録はできません")
    end
  end
end
