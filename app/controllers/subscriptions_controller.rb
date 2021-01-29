class SubscriptionsController < ApplicationController
    before_action :set_subscription, only: [:show, :update, :destroy]

    def index
        @subscriptions = Subscription.all
        render json: @subscriptions
    end

    def create
        @subscription = Subscription.create subscription_params
        if @subscription.errors.any?
            render json: @subscription.errors, status: :unprocessable_entity
        else
            render json: @subscription, status: 201
        end
    end

    def show
        render json: @subscription
    end

    def update
        @subscription.update subscription_params
        if @subscription.errors.any?
            render json: @subscription.errors, status: :unprocessable_entity
        else
            render json: @subscription, status: 204
        end
    end

    def destroy
        @subscription.delete
        render json: 204
    end

    private
    def subscription_params
        params.require(:subscription).permit(:name, :logo_image, :amount, :description, :user_id)
    end

    def set_subscription
        begin
            @subscription = Subscription.find(params[:id])
        rescue
            render json: {error: "Subscription not found"}, status: 404
        end
    end
end
