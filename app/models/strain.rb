class Strain < ApplicationRecord
  has_and_belongs_to_many :effects
  has_and_belongs_to_many :flavors
  has_many :ratings

  # scope :search_by_effects, -> (search) {joins(:effects).where('effects.name LIKE :search', "%#{search}%")}
  # scope :search_by_flavors, -> (search) {joins(:flavors).where('flavors.name LIKE :search', "%#{search}%")}
  # scope :search_by_rating, -> (search) {where("rating > :search", "%#{search}#%")}

  scope :search_by_effects, -> (search) { joins(:effects).where(effects: { name: search.capitalize }) }
  scope :search_by_flavors, -> (search) { joins(:flavors).where(flavors: { name: search.capitalize }) }
  scope :search_by_rating, -> (search) { where "rating >= ?", search }

  validates :name, presence: true

end
