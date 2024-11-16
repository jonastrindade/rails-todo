class ApplicationController < ActionController::Base
  include Pundit::Authorization

  allow_browser versions: :modern
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[cpf])
  end

  def after_sign_in_path_for(resource)
    products_todo_tasks_path
  end
end
