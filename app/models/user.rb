class User < ActiveRecord::Base
  has_many :recipe
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  validates_presence_of :name
  before_create :ensure_default_role

  ROLES = %w[admin member]

  def role?(requestedRole)
    role == requestedRole.to_s
  end

  def role_symbols
    [role.to_sym]
  end

  private

    def ensure_default_role
      self.role ||= 'member'
    end
end
