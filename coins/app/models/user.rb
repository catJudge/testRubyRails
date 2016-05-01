class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts , :dependent => :destroy
  has_many :blogs , :dependent => :destroy

  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, length: { minimum: 2 }
  validates :password, presence: true, length: { minimum: 2 }
  before_save { self.email = email.downcase }

  def admin?
    return @user.is_admin
  end

end
