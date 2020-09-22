class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-fiction)}
  validate :must_be_clickbait

  CLICKBAIT = [/Won't Believe/i, /Secret/i, /Top (1..100)/i, /Guess/i]

  def must_be_clickbait
    if CLICKBAIT.none? do |t|
       t.match title
    end
      errors.add(:title, "Must be clickbait")
    end 
  end 

 


end
