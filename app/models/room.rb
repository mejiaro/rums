class Room < ApplicationRecord
  has_many :reservations

  def total_reservations(date_start, date_end)
    reservations.where(start_time: date_start..date_end).count
  end
end
