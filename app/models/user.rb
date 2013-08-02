class User < ActiveRecord::Base
  has_one :configuration, dependent: :delete
  has_many :data_files, dependent: :delete_all

  # Callbacks
  before_save { self.email = email.downcase }

  # Name validation
  validates :name, presence: true, length: { maximum: 50 }

  # Email validation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }

  # Password validation
  validates :password, length: { minimum: 6, maximum: 16 }

  has_secure_password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end

end
