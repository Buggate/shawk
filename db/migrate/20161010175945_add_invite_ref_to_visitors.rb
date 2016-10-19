class AddInviteRefToVisitors < ActiveRecord::Migration[5.0]
  def change
    add_reference :visitors, :invite, foreign_key: true
  end
end
