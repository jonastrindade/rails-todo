module Products
  module Todo
    class DashboardService
      attr_accessor :user_id, :user_role

      def initialize(user_id:, user_role: "common")
        @user_id = user_id
        @user_role = user_role
      end

      def tasks_status_count
        Products::Todo::TasksStatusCountQuery.new(user_id: user_id, user_role: user_role).call
      end

      def tasks_analysis_by_month
        Products::Todo::TasksAnalysisByMonthQuery.new(user_id: user_id, user_role: user_role).call
      end
    end
  end
end
