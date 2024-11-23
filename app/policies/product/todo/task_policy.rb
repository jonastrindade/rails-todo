module Product
  module Todo
    class TaskPolicy < ApplicationPolicy
      class Scope < ApplicationPolicy::Scope
        def resolve
          if user.admin?
            scope.includes(:user).all
          else
            scope.includes(:user).where(user_id: user.id)
          end
        end
      end

      def show?
        task_rule
      end

      def new?
        user.common?
      end

      def create?
        user.common?
      end

      def edit?
        task_rule
      end

      def update?
        task_rule
      end

      def delete?
        task_rule
      end

      private

      def task_rule
        if user.common?
          record.user_id == user.id
        elsif user.admin?
          true
        end
      end
    end
  end
end
