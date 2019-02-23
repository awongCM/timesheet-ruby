class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true

  belongs_to :employee, optional: true

  # Define roles for User model
  ROLES = %w[admin supervisor user]

  def has_role?(role_name)
    ROLES.include?(role_name) && (self.role.eql? role_name)
  end

end
