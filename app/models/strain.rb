class Strain < ApplicationRecord
  has_and_belongs_to_many :effects
  has_and_belongs_to_many :flavors
end
