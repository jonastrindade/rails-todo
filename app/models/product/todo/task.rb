module Product
  module Todo
    class Task < ApplicationRecord
      belongs_to :user

      # TODO add tasks validations and tests
      # TODO add tasks callbacks and tests
      # TODO add tasks mailer and tests
    end
  end
end
