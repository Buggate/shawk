class CreateParties < ActiveRecord::Migration[5.0]
	
  def change
    create_table :parties do |t|


         t.string   :title
         t.string   :venue
         t.references :user

        
      t.timestamps

    end

    add_index :parties, 'user_id'


  end


end
