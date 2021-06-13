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
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to '/'
    end
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
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @mail = params[:mail]
      @password = params[:password]
    end
  end

  def logout
    session[:user_id] = false
    redirect_to '/'
  end

  def account
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to '/'
    end
  end

  def profile
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to '/'
    end
  end

end
