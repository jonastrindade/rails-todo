module Products
  module Todo
    class TasksController < ApplicationController
      before_action :task_params, only: [ :create, :update ]
      before_action :set_task, only: [ :show, :edit, :update, :destroy ]

      # TODO add tasks filters

      def index
        @tasks = policy_scope(Product::Todo::Task).paginate(page: params[:page], per_page: 10)
      end

      def show
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
        authorize @task
      end

      def update
        if @task.update(task_params)
          flash[:notice] = "Todo successfully updated!"
          redirect_to products_todo_task_url(@task)
        else
          flash.now[:alert] = "Todo update failed"
          render :edit
        end
      end

      def destroy
        @task.destroy
        flash[:notice] = "Todo item successfully destroyed."
        redirect_to products_todo_tasks_path
      end

      private

      def task_params
        params.require(:product_todo_task).permit(:title, :description, :deadline, :status)
      end

      def set_task
        @task = Product::Todo::Task.find(params[:id])
      end
    end
  end
end
