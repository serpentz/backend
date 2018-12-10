class ChatroomSerializer < ActiveModel::Serializer
  attributes :id, :name 
  has_many :messages

  def messages
  	customized_messages = []

  	object.messages.each do |message|

  		customized_messages << {id: message.id, text: message.text, created_at: message.created_at, user: {id: message.user.id, username: message.user.username} }


  	end 
 	
 	return customized_messages

  end

end
