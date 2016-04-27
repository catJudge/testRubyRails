class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts , :dependent => :destroy
  has_many :blogs , :dependent => :destroy

  def admin?
    return @user.is_admin
  end

end
