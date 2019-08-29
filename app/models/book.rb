class Book < ApplicationRecord
    validates :title, presence: true, length: { maximum: 200, message: 'error' }
    validates :body, presence: true, length: { maximum: 200, message: 'error'}

    def user
        return User.find_by(id: self.user_id)
    end

    belongs_to :user

end
