class ChangeDataMethodToRecipes < ActiveRecord::Migration[5.2]
  def change
    change_column :recipes, :method, :text
  end
end
