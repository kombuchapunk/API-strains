class AddStrainStable < ActiveRecord::Migration[5.2]
  def change
    create_table :strains do |t|
      t.string :name
      t.decimal :rating, :precision => 2, :scale => 1
      t.string :type

      t.timestamps
    end
  end
end
