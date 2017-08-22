class UserDashboardsController < InheritedResources::Base
before_action :configure_permitted_parameters, if: :devise_controller?

  private

    def user_dashboard_params
      params.require(:user_dashboard).permit()
    end
end
