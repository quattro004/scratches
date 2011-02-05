class User < ActiveRecord::Base
  has_many :recipe
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
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
