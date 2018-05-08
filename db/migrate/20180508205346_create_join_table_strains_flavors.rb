class CreateJoinTableStrainsFlavors < ActiveRecord::Migration[5.2]
  def change
    create_join_table :strains, :flavors do |t|
      t.index [:strain_id, :flavor_id]
    end
  end
end
