require "rails_helper"

RSpec.describe 'UsersController', type: :request do
  let!(:user) { FactoryBot.create(:user) }

  describe "POST /users/sign_in" do
    let(:admin) { create(:user, role: 'admin', cpf: '12312312312') }
    let(:common) { create(:user) }

    context "with admin valid credentials" do
      it "redirects to welcome page" do
        post user_session_path, params: { user: { email: admin.email, password: '123456' } }
        expect(response).to redirect_to root_path
      end
    end

    context "with common valid credentials" do
      it "redirects to welcome page" do
        post user_session_path, params: { user: { email: common.email, password: '123456' } }
        expect(response).to redirect_to products_todo_tasks_path
      end
    end
  end
end
