class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:top, :about]

def top
end

def index
    @books = Book.all
    @book = Book.new
    @user = current_user
end

def about
end

def create
  @user = current_user
  @books = Book.all
  @book = Book.new(book_params)
  @book.user_id = current_user.id
   if @book.save
   redirect_to book_path(@book) , notice:"You have creatad book successfully."
   else
    @books = Book.all
    @user = current_user
   render "index"
   end
end

def show
     @book = Book.find(params[:id])
     @books = Book.all
     @user = current_user
     @post = Book.new
end

  def edit
    # redirect_to user_path(current_user.id)
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end
  end

  # 消していいかも
  def user
    return User.find_by(id: self.user_id)
  end

  def update
   @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book) , notice:"You have updated book successfully."
    else
      render :edit
    end
end

def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path , notice:"Book was successfully destroyed."
  end

private
def book_params
    params.require(:book).permit(:title , :body)
end

end