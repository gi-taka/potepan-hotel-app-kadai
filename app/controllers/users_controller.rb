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
      session[:user_id] = @user.id
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
      if @user.authenticate(params[:user][:password_current])
        if user_params[:password].present? && user_params[:password_confirmation].present?
          if user_params[:password] == user_params[:password_confirmation]
            if @user.update_attribute(:password, params[:user][:password])
              flash[:notice2] = "パスワードを変更しました"
            end
          else
            flash[:notice] = "新しいパスワードと確認用パスワードが一致しません"
          end
        end
        if @user.mail != params[:user][:mail]
          if @user.update_attribute(:mail, params[:user][:mail])
            flash[:notice] = "メールアドレスを変更しました"
          end
        end
      else
        flash[:notice] = "現在のパスワードが一致しません"
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

  def profile_update
    if session[:user_id]
      @user = User.find(session[:user_id])
      if params[:image].present?
        @user.update_attribute(:image, params[:image])
      end
      @user.update_attribute(:name, params[:name])
      @user.update_attribute(:introduction, params[:introduction])
      redirect_to '/users/profile'
    else
      render '/'
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :mail, :password, :password_confirmation, :password_digest, :password_current, :introduction, :image)
  end

end
