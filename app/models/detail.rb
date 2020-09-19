class Detail < ApplicationRecord

  belongs_to :client, optional: true

  with_options presence: {message: "が空です"} do
    validates :mbp_high
    validates :mbp_low
  end

end
