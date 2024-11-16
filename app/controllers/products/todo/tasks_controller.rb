module Products
  module Todo
    class TasksController < ApplicationController
      
      def index
        @tasks = policy_scope(Product::Todo::Task)
      end
    end
  end
end
