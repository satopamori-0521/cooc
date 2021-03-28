class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    
    has_secure_password
    
    has_many :recipes
    has_many :favorites
    has_many :likes, through: :favorites, source: :recipe
    
    def favorite(other_recipe)
        unless self == other_recipe
            self.favorites.find_or_create_by(recipe_id: other_recipe.id)
        end
    end
    
    def unfavorite(other_recipe)
        favorite = self.favorites.find_by(recipe_id: other_recipe.id)
        favorite.destroy if favorite
    end
    
    def like?(other_recipe)
        self.likes.include?(other_recipe)
    end
    
end
