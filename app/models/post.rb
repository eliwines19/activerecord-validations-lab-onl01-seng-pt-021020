class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length {minimun: 250}
  validates :summary, length {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validates :not_clickbait

  ARR = [
    /Won't Believe/,
    /Secret/,
    /Top/,
    /Guess/
  ]

  def not_clickbait
    if ARR.none? {|rec| rec.match title}
      errors.add(:title, "it must be clickbait")
  end
end
