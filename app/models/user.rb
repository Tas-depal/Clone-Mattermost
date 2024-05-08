class User < ApplicationRecord
  has_secure_password
  has_many :messages, dependent: :destroy
  validates :username, :email, :password_digest, presence: true
  validates :username, :email, uniqueness: true
  validates :password_digest, length: { minimum: 8, message: "Must be at least 8 characters long." }
  validate :password_validation
  validate :email_validation
  scope :all_except, ->(user) { where.not(id: user) }
  after_create_commit {broadcast_append_to "users"} 

  # Checks password validation
  def password_validation
    unless password_digest.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$/)
      errors.add :password_digest, "must include at least one uppercase letter, one lowercase letter, one digit, one special character"
    end
  end

  # Checks email validation
  def email_validation
    unless email.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
      errors.add :email, "is not in a valid format"
    end
  end
end
