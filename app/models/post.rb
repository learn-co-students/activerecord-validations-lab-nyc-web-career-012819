class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :not_clickbait

  CLICKBAIT_PHRASES = [
    /Won't Believe/,
    /Secret/,
    /Top\d*/,
    /Guess/
  ]

  def not_clickbait
    if CLICKBAIT_PHRASES.none? { |phrase| phrase.match self.title }
      errors.add(:title, "Clickbait detected")
    end
  end
end
