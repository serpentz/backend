class User < ApplicationRecord

	has_many :chatroom_users
	has_many :chatrooms, through: :chatroom_users
	has_many :messages

	validates :email, presence: true, uniqueness: true
	validates :username, presence: true, uniqueness: true
	validates :password, presence: true
end
