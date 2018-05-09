class Rating < ApplicationRecord
  belongs_to :strain
  after_create :update_average_rating

  def update_average_rating
    strain = self.strain
    strain.average_rating = strain.ratings.average(:rating)
    strain.save
  end

end
