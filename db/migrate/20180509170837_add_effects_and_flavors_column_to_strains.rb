class AddEffectsAndFlavorsColumnToStrains < ActiveRecord::Migration[5.2]
  def change
    add_column :strains, :strain_effects, :string
    add_column :strains, :strain_flavors, :string
  end
end
