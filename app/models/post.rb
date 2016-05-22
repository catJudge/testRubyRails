class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog

  validates :title, presence: true, length: { minimum: 2 }
  validates :text, presence: true, length: { minimum: 2 }
  validates :user_id, presence: true
  validates :blog_id, presence: true

end
