module Products
  module Todo
    class TasksController < ApplicationController
      before_action :task_params, only: [ :create, :update ]
      # TODO add tasks update and tests
      # TODO add tasks finish through update and tests
      # TODO add tasks delete and tests
      # TODO add tasks dashboard and tests

      def index
        # TODO add tasks filters
        @tasks = policy_scope(Product::Todo::Task).paginate(page: params[:page], per_page: 10)
      end

      def show
        @task = Product::Todo::Task.find(params[:id])
        authorize @task
        render :show
      end

      def new
        authorize Product::Todo::Task
        @task = Product::Todo::Task.new
      end

      def create
        @task = Product::Todo::Task.new(task_params.merge(user_id: current_user.id))
        authorize @task
        if @task.save!
          flash[:notice] = "New todo successfully added!"
          redirect_to products_todo_task_url(@task)
        else
          flash.now[:alert] = "Todo creation failed"
          render :new
        end
      end

      def edit
        @task = Product::Todo::Task.find(params[:id])
        authorize @task
      end

      def update
        @task = Product::Todo::Task.find(params[:id])
        if @task.update(task_params)
          flash[:notice] = "Todo successfully updated!"
          redirect_to products_todo_task_url(@task)
        else
          flash.now[:alert] = "Todo update failed"
          render :edit
        end
      end

      private

      def task_params
        params.require(:product_todo_task).permit(:title, :description, :deadline)
      end
    end
  end
end
