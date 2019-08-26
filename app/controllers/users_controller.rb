class UsersController < ApplicationController

  # 追加
  def books
    public_method(:book).super_method.call
  end

  def index
    @users = User.all
    # 試し
    @cser = User.find_by(id: params[:id])
  end

  def show
    # 試しにcurrent外し中
    @user = User.find_by(id: params[:id])
  end

  def new
    # 追加
    @book = Book.new
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.introduction = params[:introduction]
    if params[:image]
    @user.image_name = "#{@user.id}.jpg"
    image = params[:image]
    File.binwrite("public/user_images/#{@user.image_name}",image.read)
    end
    if @user.save
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(current_user.id)
    else
      render edit_user_path(current_user)
    end
  end

  def create
    @user = User.new(
      name: params[:name],
       email: params[:email],
       image_name: "default_user.jpg",
        password: params[:password]
      )
    if @user.save
    flash[:notice] = "Welcome! You have signed up successfully."
    else
    render("users/sign_up")
    end
  end
# 追加
    def create
      book = Book.new(book_params)
       book.save
       redirect_to books_path(book) , notice:"Book was successfully created."
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