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
    if session[:user_id]
      @user = User.find(session[:user_id])
      if @user.password_digest == user_params[:password_digest]
        if user_params[:password].present? && user_params[:password_confirmation].present?
          if user_params[:password] == user_params[:password_confirmation]
            if @user.update(user_params)
              flash[:notice] = "#{user_params[:mail]}にメールアドレスを変更します"
              flash[:notice2] = "#{user_params[:password]}/#{user_params[:password_confirmation]}にパスワードを変更します"
            end
          else
            flash[:notice] = "新しいパスワードが一致しません"
          end
        else
          @user.update(user_params)
          flash[:notice] = "#{user_params[:mail]}にメールアドレスを変更します"
        end
      else
        flash[:notice] = "#{user_params[:password_digest]}は現在のパスワードではありません"
      end
      redirect_to "/users/#{session[:user_id]}/edit"
    else
      redirect_to '/'
    end
  end

  def destroy
  end

  def sign_in
  end

  def login
    @user = User.find_by(mail: params[:mail])
    if @user && @user.authenticate(params[:password])
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

private
  def user_params
    params.require(:user).permit(:name, :mail, :password, :password_confirmation, :password_digest, :introduction)
  end

end
