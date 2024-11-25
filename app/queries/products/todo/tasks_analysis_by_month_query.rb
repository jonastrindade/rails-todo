module Products
  module Todo
    class TasksAnalysisByMonthQuery
      attr_accessor :user_id, :user_role

      def initialize(user_id:, user_role:)
        @user_id = user_id
        @user_role = user_role
      end

      def call
        data = Product::Todo::Task.find_by_sql([ query, build_args ])
        array_data(data)
      end

      private

      def query
        File.read("app/queries/sql_files/tasks_analysis_by_month.sql")
      end

      def build_args
        {
          user_id: user_id,
          user_role: user_role
        }
      end

      def array_data(data)
        data_array = []
        tasks_created_count_hash = {}
        tasks_finished_count_hash = {}

        data.each do |d|
          tasks_created_count_hash.merge!({ "#{ d["month"] }": d["tasks_created_count"] })
          tasks_finished_count_hash.merge!({ "#{ d['month'] }": d["tasks_finished_count"] })
        end

        [
          { name: "Created", data: tasks_created_count_hash },
          { name: "Finished", data: tasks_finished_count_hash }
        ]
      end
    end
  end
end
