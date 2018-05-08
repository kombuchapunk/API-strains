class CreateJoinTableStrainEffect < ActiveRecord::Migration[5.2]
  def change
    create_join_table :strains, :effects do |t|
      t.index [:strain_id, :effect_id]
    end
  end
end
