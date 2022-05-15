class Post < ApplicationRecord
  validates :title, presence: true
  has_many :comments
  has_rich_text :content

end
