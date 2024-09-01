class ProfilesController < ApplicationController
  def show
  end

  def edit
  end

  def update
    user = current_user
    # params[:user] => {name: 'bob', email: 'bob@example.com'}

    # params[:user]そのままではなく、user_paramsメソッドの戻り値を渡すことで、admin=true等の不正なリクエストを防ぐ
    user.update(user_params)
  end

  private

  # 外部から渡されるパラメータをそのまま信用せず、明示的に許可したキーのみ利用する
  def user_params
    if current_user.admin?
      params.require(:user).permit(:name, :email, :admin)
    else
      params.require(:user).permit(:name, :email)
    end
  end
end
