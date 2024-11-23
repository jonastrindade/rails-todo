class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  extend Enumerize
  acts_as_paranoid

  has_many :tasks, class_name: "Product::Todo::Task"

  # TODO add users validations and tests
  # TODO add users callbacks and tests
  # TODO add users mailer and tests

  enumerize :role, in: [ :common, :admin ], default: :common, i18n_scope: "user.role"

  def admin?
    role == "admin"
  end

  def common?
    role == "common"
  end
end
