require "rails_helper"

RSpec.describe Products::Todo::TasksController, type: :request do
  describe "GET index" do
    before do
      get root_path
    end

    it "renders the index template" do
      user = create(:user)
      sign_in(user) if user.present?
      get products_todo_tasks_path
      expect(response).to render_template(:index)
    end
  end

  describe "GET new" do
    before do
      get root_path
    end

    it "create new task object" do
      user = create(:user)
      sign_in(user) if user.present?
      get new_products_todo_task_path
      expect(assigns(:task)).to be_a_new(Product::Todo::Task)
    end
  end

  describe "POST create" do
    before do
      get root_path
    end

    it "common create task object" do
      user = create(:user)
      sign_in(user) if user.present?
      post products_todo_tasks_path,
        params: { product_todo_task: { title: Faker::Lorem.sentence, description: Faker::Lorem.paragraphs,
        deadline: Faker::Date.forward } }

      follow_redirect!
      expect(response.body).to include("New todo successfully added!")
    end

    it "admin fail create task object" do
      user = create(:user, role: 'admin')
      sign_in(user) if user.present?
      post products_todo_tasks_path,
        params: { product_todo_task: { title: Faker::Lorem.sentence, description: Faker::Lorem.paragraphs,
        deadline: Faker::Date.forward } }

      follow_redirect!
      expect(response.body).to include("You are not authorized to perform this action.")
    end
  end
end
