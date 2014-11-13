class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def show_flash_error(field)
    flash[:error] = "Transaction Failed. Please check the following fields [ #{field.errors.messages.keys.join(", ")} ]"
  end
end
