class ChatroomUser < ApplicationRecord
	belongs_to :user
	belongs_to :chatroom
	validates :chatroom, uniqueness: {scope: :user}
end
