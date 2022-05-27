class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :show, :update, :destroy]

  def new
    @user = User.new()
  end

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User successfully created' }
        format.json { render :index, notice: 'User successfully created' }
      else
        format.html { render :new, notice: 'Error occurred' }
        format.json { render :index, notice: 'Error occurred' }
      end
    end
  end

  def update
    @user = @user.update_attributes(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User successfully created' }
        format.json { render :index, notice: 'User successfully created' }
      else
        format.html { render :new, notice: 'Error occurred' }
        format.json { render :index, notice: 'Error occurred' }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def find_user
    @user = User.find_by(params[:id])
  end
end
