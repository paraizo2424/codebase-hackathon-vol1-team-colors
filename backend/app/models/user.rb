class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :studied_records
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensintive: false },
            length: { maximum: 255 }, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }, if: :new_record?
  validates :password_confirmation, presence: true, if: :new_record?
  validates :note, length: { maximum: 255 }
end
