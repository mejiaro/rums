class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validate :confirmed_reservations_must_be_less_or_equal_to_max_reservations


  def confirmed_reservations_must_be_less_or_equal_to_max_reservations
    errors.add(:room, "must be less or equal to max reservations") if
      #room.reservations.where("").count + 1 > room.max_reservations
      room.reservations.where(start_time: self.start_time.beginning_of_day..self.start_time.end_of_day).count+1  > room.max_reservations
  end
end
