class UsersController < ApplicationController
    # def create
    #     @user = User.create user_params
    #     if @user.save
    #         auth_token = Knock::AuthToken.new payload: {sub: @user.id}
    #         render json: {first_name: @user.first_name, jwt: auth_token.token}, status: :created
    #     else
    #         render @user.errors, status: :unprocessable_entity
    #     end
    # end

    # def sign_in
    #     @user = User.find_by_email(params[:email])
    #     if @user && @user.authenticate(params[:password])
    #         auth_token = Knock::AuthToken.new payload: {sub: @user.id}
    #         render json: {first_name: @user.first_name, jwt: auth_token.token}, status: 200
    #     else
    #         render json: {error: 'Incorrect Email or Password'}, status: 404
    #     end
    # end

    # private
    # def user_params
    #     params.permit(:user, :first_name, :email, :password, :password_confirmation)
    # end

    def index
        @users = User.all
           if @users
              render json: {
              users: @users
           }
          else
              render json: {
              status: 500,
              errors: ['no users found']
          }
         end
    end
def show
       @user = User.find(params[:id])
           if @user
              render json: {
              user: @user
           }
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
private
      
     def user_params
         params.require(:user).permit(:first_name, :password, :password_confirmation)
     end
end
