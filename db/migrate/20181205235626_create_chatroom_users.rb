class CreateChatroomUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :chatroom_users do |t|

      t.timestamps
    end
  end
end
