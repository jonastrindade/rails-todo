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
        if user.common?
          record.user_id == user.id
        elsif user.admin?
          true
        end
      end

      def new?
        user.common?
      end
      
      def create?
        user.common?
      end


      def edit?
        if user.common?
          record.user_id == user.id
        elsif user.admin?
          true
        end
      end

      def update?
        if user.common?
          record.user_id == user.id
        elsif user.admin?
          true
        end
      end
    end
  end
end
