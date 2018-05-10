class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate

    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: { auth_token: command.result instructions: "Use this as a header labeled authorization in your future requests"}
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
