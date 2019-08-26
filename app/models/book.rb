class Book < ApplicationRecord
    validates :title, length: { maximum: 200 }

    has_many :users

    belongs_to :user

end
