class SessionsController < ApplicationController
  # new, create login, destroy logout
  before_action :require_logged_in, only: :destroy

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(user_params)
    if @user.nil?
      flash.now[:errors] = ["Invalid Credentials"]
      render :new
    else
      log_in(@user)
      redirect_to subs_url
    end
  end

  def destroy
    log_out
    render :new
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
