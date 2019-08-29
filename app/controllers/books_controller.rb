class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:top, :new]

def top
end

def index
    @books = Book.all
    @book = Book.new
    @user = current_user
end

def new
end

def create
  @book = current_user.books.build(book_params)
  @book.user_id = current_user.id
   if @book.save
   redirect_to book_path(@book) , notice:"You have creatad book successfully."
   else
    # 追記
    @books = Book.all
     render books_path(@book)
   end
end

def show
     @book = Book.find_by(id: params[:id])
     @books = Book.all
     @user = current_user
end

  def edit
    @book = Book.find(params[:id])
  end

  def user
    return User.find_by(id: self.user_id)
  end

  def update
   book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book) , notice:"You have updated book successfully."
end

def ensure_correct_user
  @book = Book.find_by(id: params[:id])
  if @book.user_id != @current_user.id
  flash[:notice] = "unauthorised"
  redirect_to books_path(@book)
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