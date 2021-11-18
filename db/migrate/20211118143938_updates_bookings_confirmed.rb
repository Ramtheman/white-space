class UpdatesBookingsConfirmed < ActiveRecord::Migration[6.0]
  def change
    change_column_default :bookings, :confirmed, from: false, to: nil
  end
end
