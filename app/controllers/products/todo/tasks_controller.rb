module Products
  module Todo
    class TasksController < ApplicationController
      def index
        @tasks = policy_scope(Product::Todo::Task).paginate(page: params[:page], per_page: 10)
      end

      def new
        @task = Product::Todo::Task.new
      end

      def create
        @task = Product::Todo::Task.new(create_params.merge(user_id: current_user.id))
        if @task.save!
          flash[:success] = "New todo successfully added!"
          redirect_to products_todo_tasks_url
        else
          flash.now[:error] = "Todo creation failed"
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
