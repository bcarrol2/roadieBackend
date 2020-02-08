class Review < ApplicationRecord
    validates :rating, presence: true, length: { in: 1..5 }
    validates :name, presence: true, length: { minimum: 2 }
    validates :title, presence: true, length: { minimum: 1 }
    validates :review_text, presence: true, length: { minimum: 2 }
end
