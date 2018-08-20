class User < ActiveRecord::Base
  before_validation :downcase_email

  has_secure_password

  validates :password, length: { minimum: 6 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true

  def self.authenticate_with_credentials(email, password)
    @email = email.strip.downcase
    user = User.find_by_email(@email)
    if user.authenticate(password)
      return user
    else
      return nil
    end
  end

  def downcase_email
    self.email = email.downcase if email.present?
  end


end
