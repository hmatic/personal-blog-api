module Api
  module V1
    class UsersController < ApiController
      before_action :ensure_authenticated, except: :create

      def index
        render json: UsersQuery.new.with_post_count.ordered
      end

      def show
        render json: single_user(params[:id])
      end

      def create
        user_form = RegisterUserForm.new(user_params)
        if user_form.save
          render json: single_user(user_form.id), serializer: UserSerializer
        else
          render json: { errors: user_form.errors }, status: :bad_request
        end
      end
      
      def update

      end

      def destroy
        user_record = authorize(User.find(params[:id]))
        if current_user.authenticate(user_params[:password])
          user_record.destroy
        else
          render json: { errors: { password: ['is invalid'] } },
                  status: :unauthorized
        end
      end

      private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
      end

      def update_user_params
        user_params.permit(:current_password)
      end

      def single_user(id)
        UsersQuery.new.with_post_count.find(id)
      end
    end
  end
end