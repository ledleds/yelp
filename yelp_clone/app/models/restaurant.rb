class Restaurant < ActiveRecord::Base
    has_many :reviews, dependent: :destroy
    validates :name, length: { minimum: 3 }, uniqueness: true

  def average_rating
      reviews.average(:rating)
  end

end
