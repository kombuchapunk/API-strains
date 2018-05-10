class AddRatingsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.decimal :rating, :decimal, :precision => 2, :scale => 1
      t.integer :strain_id

      t.timestamps
    end
  end
end
