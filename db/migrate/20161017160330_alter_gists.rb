class AlterGists < ActiveRecord::Migration[5.0]
  def change

  	remove_foreign_key :gists, column: :group_id

  	remove_foreign_key :gists, column: :profile_id

  	remove_column :gists, :group_id


  	remove_column :gists, :profile_id

  	add_reference :gists, :party, foreign_key: true
  end
end
