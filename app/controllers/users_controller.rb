class UsersController < ApplicationController
  skip_before_action :authenticate_request
  def create

    @user = User.new(user_params)
    if @user.save
      mg_client = Mailgun::Client.new
      command = AuthenticateUser.call(params[:email], params[:password])
      NotifierMailer.welcome(command.result, params[:name], params[:email]).deliver # sends the email
      render json: { confirmation: "Auth key has been sent to #{params[:email]}"}
    else
      render json: { error: "email already in use" }, status: :unauthorized
    end
  end

  def send_simple_message
      RestClient.post "https://api:key-57a2b30353c9ec216a1fc7b610d05f50",
          "@api.mailgun.net/v3/sandboxd857a67b703546478106f6fe56ea8ce3.mailgun.org/messages",
          :from => "Mailgun Sandbox <postmaster@sandboxd857a67b703546478106f6fe56ea8ce3.mailgun.org>",
          :to => "Chase Bowden <chase.bowden.pdx@gmail.com>",
          :subject => "Hello Chase Bowden",
          :text => "Congratulations Chase Bowden, you just sent an email with Mailgun!  You are truly awesome!"
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation, :name)
  end

end
