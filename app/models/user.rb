class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # バリデーション一時削除
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         validates :name, presence: true, length: { in: 2..20, message: 'error' },
                      uniqueness: true

         validates :introduction, length: { maximum: 50, message: 'error' }

         has_many :books, dependent: :destroy
        #  追加
         attachment :profile_image

end
