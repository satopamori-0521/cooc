class ChangeDatatypeTitleORecipes < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :materials, :text
  end
end