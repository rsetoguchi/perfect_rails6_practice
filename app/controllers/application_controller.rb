class ApplicationController < ActionController::Base
  # ブロックを用いてフックを定義することも可能
  # before_action do
  #   redirect_to access_denied_path if params[:token].blank?
  # end
end
