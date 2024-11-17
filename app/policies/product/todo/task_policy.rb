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
    end
  end
end
