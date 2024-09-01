class ApplicationController < ActionController::Base
  # ブロックを用いてフックを定義することも可能
  # before_action do
  #   redirect_to access_denied_path if params[:token].blank?
  # end

  # rescue_from LoginFailed, with: :login_failed

  # def login_failed
  #   render template: 'shared/login_failed', status: 401
  # end
end
