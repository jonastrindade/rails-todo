class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend Enumerize

  enumerize :role, in: [ :common, :admin ], default: :common, i18n_scope: "user.role"

  def admin?
    role == "admin"
  end

  def common?
    role == "common"
  end
end
