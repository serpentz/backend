class Chatroom < ApplicationRecord

	has_many :chatroom_users
	has_many :users, through: :chatroom_users
	has_many :messages

	validates :name, uniqueness: true, presence: true
	



end
