class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome #{@user.username} to the LifeStyle Articles app"
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def show
  end
  
  def edit
  end

  def update

  end

  def destroy

  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username)
    end
end
