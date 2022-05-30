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
        format.html { redirect_to user_path(@user), notice: 'User successfully created' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, notice: 'Error occurred' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = @user.update_attributes(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_path(@user), notice: 'User successfully Updated' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, notice: 'Error occurred' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { render :index, notice: 'User successfully Destroyed'}
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
