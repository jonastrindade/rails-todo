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

  describe "GET show" do
    before do
      get root_path
    end

    it "renders the index template" do
      user = create(:user)
      sign_in(user) if user.present?
      task = create(:task, user_id: user.id)
      get products_todo_task_path(task)
      expect(response).to render_template(:show)
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

    it "common fail create task object" do
      user = create(:user)
      sign_in(user) if user.present?
      post products_todo_tasks_path,
        params: { product_todo_task: { title: Faker::Lorem.sentence, description: Faker::Lorem.paragraphs,
        deadline: '123' } }

      expect(response.code).to eq("422")
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

  describe "GET edit" do
    before do
      get root_path
    end

    it "renders the edit template" do
      user = create(:user)
      sign_in(user) if user.present?
      task = create(:task, user_id: user.id)
      get edit_products_todo_task_path(task)
      expect(response).to render_template(:edit)
    end
  end

  describe "PATCH update" do
    before do
      get root_path
    end

    it "common update task object" do
      user = create(:user)
      sign_in(user) if user.present?
      task = create(:task, user_id: user.id)
      patch products_todo_task_path(task),
        params: { product_todo_task: { title: Faker::Lorem.sentence, description: Faker::Lorem.paragraphs,
        deadline: Faker::Date.forward } }

      follow_redirect!
      expect(response.body).to include("Todo successfully updated!")
    end

    it "common fail update task object" do
      user = create(:user)
      sign_in(user) if user.present?
      task = create(:task, user_id: user.id)
      patch products_todo_task_path(task),
        params: { product_todo_task: { title: Faker::Lorem.sentence, description: Faker::Lorem.paragraphs,
        deadline: '123' } }

      expect(response.body).to include("Todo update failed")
    end

    it "admin update task object" do
      user = create(:user, role: 'admin')
      sign_in(user) if user.present?
      task = create(:task, user_id: user.id)
      patch products_todo_task_path(task),
        params: { product_todo_task: { title: Faker::Lorem.sentence, description: Faker::Lorem.paragraphs,
        deadline: Faker::Date.forward } }

      follow_redirect!
      expect(response.body).to include("Todo successfully updated!")
    end

    it "admin fail update task object" do
      user = create(:user)
      sign_in(user) if user.present?
      task = create(:task, user_id: user.id)
      patch products_todo_task_path(task),
        params: { product_todo_task: { title: Faker::Lorem.sentence, description: Faker::Lorem.paragraphs,
        deadline: '123' } }

      expect(response.body).to include("Todo update failed")
    end
  end

  describe "PATCH update" do
    before do
      get root_path
    end

    it "common delete task object" do
      user = create(:user)
      sign_in(user) if user.present?
      task = create(:task, user_id: user.id)
      delete products_todo_task_path(task)

      follow_redirect!
      expect(response.body).to include("Todo item successfully destroyed.")
    end

    it "admin delete task object" do
      user = create(:user, role: 'admin')
      sign_in(user) if user.present?
      task = create(:task, user_id: user.id)
      delete products_todo_task_path(task)

      follow_redirect!
      expect(response.body).to include("Todo item successfully destroyed.")
    end
  end
end
