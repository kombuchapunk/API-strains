class ChangeNameOfRatingOnStrainsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :strains, :rating, :decimal
    add_column :strains, :average_rating, :decimal, :precision => 2, :scale => 1
  end
end
