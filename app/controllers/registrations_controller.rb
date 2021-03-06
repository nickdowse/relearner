class RegistrationsController < Devise::RegistrationsController
  after_action :allow_iframe, only: [:new, :create]

  protected

  def after_sign_up_path_for(resource)
    '/relearnables/' # Or :prefix_to_your_route
  end

  def after_sign_in_path_for(resource)
    '/relearnables/' # Or :prefix_to_your_route
  end
end
