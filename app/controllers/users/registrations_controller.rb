# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opt = {})
    if resource.persisted?
      render json: {
        message: "Signed up successfully",
        user: resource.as_json(only: [:id, :email, :username, :name])
      }, status: :created
    else
      render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
