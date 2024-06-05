class ChatsController < ApplicationController  
  def index
  end

  def update
    @message = params[:message]
    client = OpenAI::Client.new(
      access_token: Rails.application.credentials.openia.access_token,
      log_errors: true, # TODO: configure from initializer
    )
    response = client.chat(
      parameters: {
          model: "gpt-4o",
          messages: [{ role: "user", content: @message }],
      })
    @response = response.dig("choices", 0, "message", "content")
    render :index
  end
end
