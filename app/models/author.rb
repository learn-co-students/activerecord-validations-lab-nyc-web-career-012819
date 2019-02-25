class Author < ActiveRecord::Base
  validates :name, presence: true
  validates :phone_number, length: {is: 10 }
  validates :phone_number, numericality: { only_integer: true, message: "Numbers only!"}
  validates :name, uniqueness: true

end
