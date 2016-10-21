class AddOwnerToGists < ActiveRecord::Migration[5.0]
  def change
    add_column :gists, :owner, :string
  end
end
