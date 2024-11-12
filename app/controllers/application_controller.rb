class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[cpf])
  end

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_products_todo_tasks_path
    else
      products_todo_tasks_path
    end
  end
end
