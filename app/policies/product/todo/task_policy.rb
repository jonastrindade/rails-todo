module Product
  module Todo
    class TaskPolicy < ApplicationPolicy
      class Scope < ApplicationPolicy::Scope
        def resolve
          if user.admin?
            scope.all
          else
            scope.where(user_id: user.id)
          end
        end
      end

      def update?
        user.admin? or not record.published?
      end
    end
  end
end
