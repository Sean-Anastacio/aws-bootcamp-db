class UsersController < ApplicationController
  def new
    if User.find_by(id: 1)
      redirect_to edit_user_path(1)
      return
    end

    @user = User.new
  end
  def edit
    @user = User.find(params[:id])
  end

  def create
    if user_params[:name].blank?
      redirect_to root_path
      return
    end

    @user = User.new(user_params)
    @user.id = 1
    @user.save!
    redirect_to root_path
  end

  def update
    @user = User.find(params[:id])

    if user_params[:name].blank?
      @user.destroy!
      redirect_to root_path
      return
    end

    @user.update!(user_params)
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:id, :name)
  end
end