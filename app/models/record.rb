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

  with_options presence: { nessage: 'が入力されていません。' } do
    validates :client_id
    validates :user_id
    validates :major_item_id,  numericality: { other_than: 1, message: 'が選択されていません。' }
    validates :main_item_id,   numericality: { other_than: 1, message: 'が選択されていません。' }
    validates :sub_item_id,    numericality: { other_than: 1, message: 'が選択されていません。' }
    validates :start_time
    validates :end_time
    validates :carryout_id
  end

  validates :urine_amount, numericality: { only_integer: true, message: 'は数字で入力してください。' }
  validates :urine_amount, format: { with: /\A[0-9]+\z/, message: 'は半角数字のみ使用できます。' }
  validate :time_check

  def time_check
    errors.add(:start_time, '未来の記録はできません') if (carryout_id == 2) && (start_time > Time.current)
    errors.add(:end_time, '未来の記録はできません') if (carryout_id == 2) && (end_time > Time.current)
  end

  def not_carryout
    self.carryout_id == 1
  end

  def main_item
    Main.find(self.main_item_id).name
  end

  def sub_item
    Sub.find(self.sub_item_id).name
  end

  def carry_status
    Carry.find(self.carryout_id).name
  end
  
  def user_name
    User.find(self.user_id).name
  end

end
