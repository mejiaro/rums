class AddMaxReservationsToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :max_reservations, :integer, default: 1
  end
end
