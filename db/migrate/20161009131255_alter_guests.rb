class AlterGuests < ActiveRecord::Migration[5.0]

  def change

  	rename_table("guests", "visitors")



  end


end
