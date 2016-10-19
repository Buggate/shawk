class AddRefPartyToVisitors < ActiveRecord::Migration[5.0]
  def change
    add_reference :visitors, :party, foreign_key: true
  end
end
