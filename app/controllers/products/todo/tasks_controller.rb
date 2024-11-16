module Products
  module Todo
    class TasksController < ApplicationController
      skip_before_action :authenticate_user!, only: [ :index ]

      def index
        @tasks = policy_scope(Product::Todo::Task)
      end
    end
  end
end
