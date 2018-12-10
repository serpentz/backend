class AddReferencesToChatroomUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :chatroom_users, :user_id, :bigint 
  	add_column :chatroom_users, :chatroom_id, :bigint 
  end
end
