class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :title_is_sufficiently_clickbaity

    SUFFICIENT_CLICKBAIT = [/Won't Believe/i, /Secret/i, /Top (1..100)/i, /Guess/i]

    def title_is_sufficiently_clickbaity
        if !SUFFICIENT_CLICKBAIT.any? do |clickbait|
            clickbait.match title
        end
            errors.add(:title, "Must be clickbait")
        end
    end
end
