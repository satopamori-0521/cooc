class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :image
      t.string :content
      t.string :materials
      t.string :method
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
