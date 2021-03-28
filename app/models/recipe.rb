class Recipe < ApplicationRecord
  belongs_to :user
  has_many :favorites
  
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true, length: { maximum: 255 }
  validates :materials, presence: true
  validates :method, presence: true
end
