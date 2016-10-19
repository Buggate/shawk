class AddVisitorRefToReservations < ActiveRecord::Migration[5.0]
  def change
    add_reference :reservations, :visitor, foreign_key: true
  end
end
