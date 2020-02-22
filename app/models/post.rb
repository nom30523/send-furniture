class Post < ApplicationRecord
  validates :title, :image, :content, presence: true

  belongs_to :user
end
