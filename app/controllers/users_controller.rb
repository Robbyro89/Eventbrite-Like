class UsersController < ApplicationController
  before_action :login_require, except:[:new, create]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = "Bonjour #{@user}"
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def params_user
    params.permit(:name, :email, :password_digest)
  end

end
