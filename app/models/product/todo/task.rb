module Product
  module Todo
    class Task < ApplicationRecord
      extend Enumerize

      belongs_to :user

      # TODO add tasks validations and tests
      # TODO add tasks callbacks and tests
      # TODO add tasks mailer and tests

      validate :valid_deadline

      def self.default_scope
        order(status: :desc, deadline: :asc)
      end

      enumerize :status, in: [ :to_finish, :finished ], default: :to_finish, i18n_scope: "user.role"

      private

      def valid_deadline
        unless deadline.is_a?(Date)
          errors.add(:date_column, "must be a valid date")
        end
      end
    end
  end
end
