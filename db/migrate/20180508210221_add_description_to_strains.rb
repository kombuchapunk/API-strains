class AddDescriptionToStrains < ActiveRecord::Migration[5.2]
  def change
    add_column :strains, :description, :string
  end
end
