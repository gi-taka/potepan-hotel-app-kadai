class UsersController < ApplicationController

  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :mail, :password))
    if @user.save
      redirect_to '/'
    else
      render 'sing_up'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def sign_in
  end

  def sign_up
  end
end
