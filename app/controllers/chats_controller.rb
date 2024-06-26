class ChatsController < ApplicationController  
  def index
  end

  def update
    @message = params[:message]
    session[:conversation] ||= []
    session[:conversation] << { role: 'user', content: @message }

    client = OpenAI::Client.new
    response = client.chat(
      parameters: {
          model: 'gpt-4o',
          messages: session[:conversation],
      })
    @response = response.dig("choices", 0, "message", "content")
    
    session[:conversation] << { role: "assistant", content: @response }
    @conversation = session[:conversation]
    
    render :index
  end
end
