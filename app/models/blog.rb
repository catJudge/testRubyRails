class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :posts , :dependent => :destroy

  validates :title, presence: true, length: { minimum: 2 }
  validates :text, presence: true, length: { minimum: 2 }
  validates :user_id, presence: true
end
