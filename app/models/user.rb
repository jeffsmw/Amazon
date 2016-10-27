class User < ApplicationRecord
  has_secure_password
  #
  # before_validation :downcase_email
  #
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: VALID_EMAIL_REGEX


  has_many :products, dependent: :nullify
  has_many :reviews, dependent: :nullify

  def full_name
    self.first_name.titleize + self.last_name.titleize
  end

  # private
  #
  # def downcase_email
  #   self.email.downcase! if email.present?
  # end
end
