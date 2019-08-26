class PostImagesController < ApplicationController
    def index
    end
    def new
    end
    def show
        @post_image = Post_image.find_by(id: params[:id])
        @user = User.find_by(id: @post_image.user_id)
    end
    def create
        @post_image = Post_image.new(
            content: params[:content],
            # user_idの値をログインしているユーザーのidに設定
            user_id: @current_user.id
          )
          if @post_image.save
            redirect_to books_path(book)
          else
            render new_book_path(book)
          end
    end

    def ensure_corrent_user
        @post_image = Post_image.find_by(id: params[:id])
        if @post_image.user_id != @current_user.id
            flash[:notice] = "Not authorized"
            redirect_to post_image_path(post)
    end

    def destroy
        @post_image = PostImage.find(params[:id])
        @post_image.destroy
        redirect_to post_images_path
    end
end
