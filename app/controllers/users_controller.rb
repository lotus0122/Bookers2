class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @users = User.all
    @user = current_user
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
    redirect_to edit_book_path
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(current_user.id)
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
    def create
      book = Book.new(book_params)
       book.save
       redirect_to books_path(book) , notice:"You have updated book successfully."
   end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(current_user.id)
    else
      @error_message = "email or password error"
      @email = params[:email]
      @password = params[:password]
      render new_user_session_path(@book)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end