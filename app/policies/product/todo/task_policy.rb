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
    end
  end
end
