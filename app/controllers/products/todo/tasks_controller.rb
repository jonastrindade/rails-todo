module Products
  module Todo
    class TasksController < ApplicationController
      # TODO add tasks update and tests
      # TODO add tasks finish through update and tests
      # TODO add tasks delete and tests
      # TODO add tasks dashboard and tests

      def index
        # TODO add tasks filters
        @tasks = policy_scope(Product::Todo::Task).paginate(page: params[:page], per_page: 10)
      end

      def new
        @task = Product::Todo::Task.new
      end

      def create
        @task = Product::Todo::Task.new(create_params.merge(user_id: current_user.id))
        authorize @task
        if @task.save!
          flash[:notice] = "New todo successfully added!"
          redirect_to products_todo_tasks_url
        else
          flash.now[:alert] = "Todo creation failed"
          render :new
        end
      end

      private

      def create_params
        params.require(:product_todo_task).permit(:title, :description, :deadline)
      end
    end
  end
end
