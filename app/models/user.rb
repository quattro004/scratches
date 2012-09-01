class User < ActiveRecord::Base
  has_many :recipe
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :approved
  validates_presence_of :name, :email
  before_create :ensure_default_role
  after_create :send_admin_mail

  ROLES = %w[admin member]

  def role?(requestedRole)
    role == requestedRole.to_s
  end

  def role_symbols
    [role.to_sym]
  end

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      super # Use whatever other message
    end
  end

  def self.send_reset_password_instructions(attributes={})
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if !recoverable.approved?
      recoverable.errors[:base] << I18n.t("devise.failure.not_approved")
    elsif recoverable.persisted?
      recoverable.send_reset_password_instructions
    end
    recoverable
  end

  def send_admin_mail
    UserMailer.registration_email(self).deliver
  end


  private

    def ensure_default_role
      self.role ||= 'member'
    end
end
