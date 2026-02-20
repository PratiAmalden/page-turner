# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    render json: {
      message: "Logged in successfully",
      user: resource.as_json(only: [:id, :email, :username, :name])
    }, status: :ok
  end

  def response_to_on_destroy
    if current_user
      render json: { message: "Logout successfully" }, status: :ok
    else
      render json: { message: "Something went wrong" }, status: :unauthorized
    end
  end
end
