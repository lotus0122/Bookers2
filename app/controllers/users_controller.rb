class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @books = Book.all
    @book = Book.new
  end

  def new
    # 追加
    @book = Book.new
    @user = User.new
    @user.user_images.build
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(current_user.id)
  else
    render :edit
   end
  end

  def create
    @user = User.new(
      name: params[:name],
       email: params[:email],
       image_name: "default_user.jpg",
        password: params[:password]
      )
      binding.pry
    if @user.save
    flash[:notice] = "Welcome! You have signed up successfully."
    redirect_to user_path(current_user.id)
    else
    render("users/sign_up")
    end
  end
# 追加

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end