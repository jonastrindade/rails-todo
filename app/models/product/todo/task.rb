module Product
  module Todo
    class Task < ApplicationRecord
      belongs_to :user

      # TODO add tasks validations and tests
      # TODO add tasks callbacks and tests
      # TODO add tasks mailer and tests

      validate :valid_deadline

      private

      def valid_deadline
        unless deadline.is_a?(Date)
          errors.add(:date_column, "must be a valid date")
        end
      end
    end
  end
end
