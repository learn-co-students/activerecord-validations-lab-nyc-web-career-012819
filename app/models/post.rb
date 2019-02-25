class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, :length => {minimum: 250}
  validates :summary, length: {maximum: 250}
  # validates :category, :inclusion => {in: ['Fiction', 'Non-Fiction']}
  validates :category, inclusion: {in: %w[Fiction Non-Fiction]}

  validate :clickbait
  def clickbait
    # binding.pry
    self.title =~ /Won't Believe/ || /Secret/ || /Top[number]/ || /Guess/ ? true : errors.add(:title, "Not clickbait")
  end

end
