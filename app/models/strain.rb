class Strain < ApplicationRecord
  validates :name, uniqueness: true
  has_and_belongs_to_many :effects
  has_and_belongs_to_many :flavors
  has_many :ratings

  after_create :add_flavors_table, :add_effects_table

  # scope :search_by_effects, -> (search) {joins(:effects).where('effects.name LIKE :search', "%#{search}%")}
  # scope :search_by_flavors, -> (search) {joins(:flavors).where('flavors.name LIKE :search', "%#{search}%")}
  # scope :search_by_rating, -> (search) {where("rating > :search", "%#{search}#%")}

  scope :search_by_effects, -> (search) { joins(:effects).where(effects: { name: search.capitalize }) }
  scope :search_by_flavors, -> (search) { joins(:flavors).where(flavors: { name: search.capitalize }) }
  scope :search_by_rating, -> (search) { where "rating >= ?", search }

  validates :name, presence: true

  def add_flavors_table
    self[:strain_flavors].split(',').each do |flavor|
      self.flavors.push(Flavor.find_or_create_by(name: flavor))
    end
  end

  def add_effects_table
    self[:strain_effects].split(',').each do |effect|
      self.effects.push(Effect.find_or_create_by(name: effect))
    end
  end

end
