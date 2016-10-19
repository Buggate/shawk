class CreateGists < ActiveRecord::Migration[5.0]
  def change
    create_table :gists do |t|

    	t.string   :caption
        t.integer  :party_id

        t.timestamps

    end

    add_index "gists", ["party_id"]

  end
end


    
    



 