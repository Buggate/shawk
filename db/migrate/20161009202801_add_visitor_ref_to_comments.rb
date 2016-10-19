class AddVisitorRefToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :visitor, foreign_key: true
  end
end
