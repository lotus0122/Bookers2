class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # バリデーション一時削除
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         validates :name, presence: true
         validates :introduction, length: { maximum:200 }

         has_many :post_images, dependent: :destroy
         has_many :books, dependent: :destroy
        #  追加
         attachment:profile_image

         belongs_to :book

         def email_requied?
          false
         end
         def email_changed?
          false
         end
         
         def post_images
          return Post.where(user_id: self.id)
         end

         

end
