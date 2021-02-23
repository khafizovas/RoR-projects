# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_auth

  protected

  def auth_verifier
    Rails.application.message_verifier('auth')
  end

  def fetch_current_user
    cookie_id = cookies[:user_id]
    id = auth_verifier.verified(cookie_id, purpose: :auth)
    user = User.find_by(id: id)
    @current_user = user
  end

  def require_auth
    fetch_current_user
    redirect_to login_path unless @current_user
  end
end
