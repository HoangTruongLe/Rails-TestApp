class Article < ActiveRecord::Base
    belongs_to :user
    validates :title, presence: true, length: {minimum: 10, maximum: 100}
    validates :description, presence: true, length: { minimum: 0, maximum: 300}
    validates :user_id, presence: true
end
