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
end
