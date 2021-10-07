class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def show
    render json: params
  end

  def create
    user = User.new(params.require(:user).permit(:name, :email))
    user.save!
    render json: user
  end
end