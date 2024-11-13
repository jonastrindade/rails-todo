require "rails_helper"

RSpec.describe Products::Todo::TasksController, type: :controller do
  describe "GET index" do    
    it "renders the index template" do
      sign_in(:user)
      get(:index, 'test')
      expect(response).to render_template("index")
    end
  end
end