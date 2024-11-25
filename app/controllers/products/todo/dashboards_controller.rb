module Products
  module Todo
    class DashboardsController < ApplicationController
      def index
        dashboard_service = Products::Todo::DashboardService.new(user_id: current_user.id, user_role: current_user.role)
        @tasks_status_count = dashboard_service.tasks_status_count
        @tasks_analysis_by_month = dashboard_service.tasks_analysis_by_month
      end
    end
  end
end
