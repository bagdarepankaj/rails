class Post < ApplicationRecord
  validates :title, presence: true
  has_many :comments, dependent: :destroy
  has_rich_text :content

end
