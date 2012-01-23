class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name,:access_code
  has_many :announcements
  
  validates_presence_of :name
  validate :access_code_is_legit
  
  def access_code
    @access_code
  end
  
  def access_code=(new_access_code)
    @access_code = new_access_code
  end
  
  private
  def access_code_is_legit
    errors.add(:base,"Access Code is Invalid") unless id.nil? && @access_code == valid_access_code
  end
  
  def valid_access_code
    "x23phi"
  end
end
