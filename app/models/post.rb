class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates_inclusion_of :category, :in => ["Fiction", "Non-Fiction"]
  validate :clickbait

  def clickbait
    if title =~ /Won't Believe/ || title =~ /Secret/ || title =~ /Top \d/ || title =~ /Guess/
      return true
    else
      errors.add(:title, "Must be click-bait")
    end
  end
  # validates :category, presence: true, :inclusion => { :in => ["Fiction", "Non-Fiction"]}
end
