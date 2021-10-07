class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def show
    render json: params
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    render json: User.update(user_params)
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end