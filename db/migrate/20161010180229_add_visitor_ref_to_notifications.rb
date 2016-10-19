class AddVisitorRefToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_reference :notifications, :visitor, foreign_key: true
  end
end
