class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|


    t.integer  :guest_id
    t.integer  :group_id
    t.integer  :host_id
    t.boolean  :read
    
    t.integer  :invite_id

      t.timestamps
      
    end
  end
end

