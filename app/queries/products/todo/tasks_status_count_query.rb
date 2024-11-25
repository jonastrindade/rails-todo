module Products
  module Todo
    class TasksStatusCountQuery
      attr_accessor :user_id, :user_role

      def initialize(user_id:, user_role:)
        @user_id = user_id
        @user_role = user_role
      end

      def call
        Product::Todo::Task.find_by_sql([ query, build_args ])
      end

      private

      def query
        File.read("app/queries/sql_files/tasks_status_count.sql")
      end

      def build_args
        {
          user_id: user_id,
          user_role: user_role
        }
      end
    end
  end
end
