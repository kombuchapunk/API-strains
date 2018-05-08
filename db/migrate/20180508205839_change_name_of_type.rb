class ChangeNameOfType < ActiveRecord::Migration[5.2]
  def change
    remove_column :strains, :type
    add_column :strains, :type_name, :string
  end
end
