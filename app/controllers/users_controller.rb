class UsersController < ApplicationController

  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :mail, :password, :password_confirmation))
    if @user.save
      redirect_to '/'
    else
      render '/users/new'
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

  def login
    @user = User.find_by(mail: params[:mail], password_digest: params[:password])
    if @user
      redirect_to '/'
    else
      @mail = params[:mail]
      @password = params[:password]
    end
  end

end
