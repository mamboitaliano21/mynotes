require 'rest_client'

class MynotesController < ApplicationController

  
  def auth
	username = params[:name]
	password = params[:password]
	if (username != 0)
		token = RestClient.post 'candidate.apiary.io/login', :params => {:username => username, :password => password}
		@parsedToken = ActiveSupport::JSON.decode(token) 
	end
	return @parsedToken
  end

  def notes
	@message = auth['message']
	@session = auth['session-token']
	notes = RestClient.get 'candidate.apiary.io/notes', :params => {:'session-token' => @session}
	@parsedNotes = ActiveSupport::JSON.decode(notes) 
  end
  
  def logout
	@session = auth['session-token']
	message = RestClient.delete 'candidate.apiary.io/logout', :params => {:'session-token' => @session}
	@parsedMessage = ActiveSupport::JSON.decode(message)
  end
  

  
  
end


