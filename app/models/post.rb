class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait

  def clickbait
    if title =~ /Won't Believe/ || title =~ /Secret/ || title =~ /Top \d/ || title =~ /Guess/
      return true
    else
      errors.add(:title, "Must be click-bait")
    end
  end


end
