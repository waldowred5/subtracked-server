class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        if @user
            render json: {user: @user}
        else
            render json: {
                status: 500,
                errors: ['user not found']
            }
        end
    end
      
    def create
        @user = User.new(user_params)
        if @user.save
            login!  
            render json: {
                status: :created,
                user: @user
            }
        else 
            render json: {
                status: 500,
                errors: @user.errors.full_messages
            }
        end
    end

    def update
        
    end

    private
      
    def user_params
        params.require(:user).permit(:first_name, :email, :password, :password_confirmation)
    end
end


#     before_action :authenticate_user
#     before_action :set_subscription, only: [:show, :update, :destroy]
#     before_action :check_ownership, only: [:update, :destroy]

#     def index
#         @subscriptions = current_user.subscriptions.all
#         render json: @subscriptions
#     end

#     def create
#         @subscription = current_user.subscriptions.create subscription_params
#         if @subscription.errors.any?
#             render json: @subscription.errors, status: :unprocessable_entity
#         else
#             render json: @subscription, status: 201
#         end
#     end

#     def show
#         render json: @subscription.transform_subscription
#     end

#     def update
#         @subscription.update subscription_params
#         if @subscription.errors.any?
#             render json: @subscription.errors, status: :unprocessable_entity
#         else
#             render json: @subscription, status: 204
#         end
#     end

#     def destroy
#         @subscription.delete
#         render json: 204
#     end

#     private
#     def subscription_params
#         params.require(:subscription).permit(:name, :logo_image, :amount, :description, :user_id)
#     end

#     def set_subscription
#         begin
#             @subscription = Subscription.find(params[:id])
#         rescue
#             render json: {error: "Subscription not found"}, status: 404
#         end
#     end

#     def check_ownership
#         if current_user.id != @subscription.user.id
#             render json: {error: "Sorry, you don't have permission to change this"}, status: 401
#         end
#     end
# end