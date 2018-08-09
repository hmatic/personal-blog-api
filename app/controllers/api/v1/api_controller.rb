module Api
  module V1
    class ApiController < ActionController::API
      include Pundit
      
      rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
      rescue_from Pundit::NotAuthorizedError, with: :render_forbidden
      rescue_from ActionController::ParameterMissing, with: :render_bad_request

      def current_user
        @current_user ||= User.find_by(token: request.headers['Authorization'])
      end

      def ensure_authenticated
        return if current_user.present?
        render json: { errors: { token: ['is invalid'] } },
               status: :unauthorized
      end
  
      def render_not_found
        render json: { errors: { resource: ["doesn't exist"] } },
               status: :not_found
      end
  
      def render_bad_request(exception)
        render json: { errors: { exception.param => ['is missing'] } },
               status: :bad_request
      end
  
      def render_forbidden
        render json: { errors: { resource: ['is forbidden'] } },
               status: :forbidden
      end
    end
  end
end
