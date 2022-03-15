# frozen_string_literal: true

module Web
  class AuthController < ApplicationController
    def callback
      user = User.find_or_initialize_by(email: auth.info.email.downcase, name: auth.info.name)
      user.save!

      sign_in user

      redirect_to root_path
    rescue ActiveRecord::RecordInvalid => e
      e.rollbar_context = { auth_hash: auth }
      raise
    end

    def destroy
      sign_out
      redirect_to root_path
    end

    private

    def auth
      request.env['omniauth.auth']
    end
  end
end
