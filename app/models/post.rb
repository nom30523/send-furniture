class Post < ApplicationRecord
  validates :title, :image, :content, presence: true

  has_many :tag_posts, dependent: :destroy
  has_many :tags, through: :tag_posts
  belongs_to :user
  has_many :comments, dependent: :destroy

  def save_tags(tag_list)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - tag_list
    new_tags = tag_list - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name: old_name)
    end

    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(tag_name: new_name)
      self.tags << post_tag
    end
  end

  def self.search(keyword)
    return Post.includes(:user) if keyword.blank?
    Post.joins(:tags).where('content LIKE(?) or tag_name LIKE(?)', "%#{keyword}%", "%#{keyword}%").distinct
  end
end
