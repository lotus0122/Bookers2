class UserController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to books_path(book)
    else
      @error_message = "email or password error"
      @email = params[:email]
      @password = params[:password]
      render new_user_session_path(@book)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
