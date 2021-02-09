class Subscription < ApplicationRecord
    belongs_to :user

    # Method for converting subscription data into a more useable form
    def transform_subscription
        return {
            subscription_owner: self.user.first_name,
            subscription_name: self.name,
            subscription_logo_image: self.logo_image,
            subscription_amount: self.amount,
            subscription_description: self.description,
            subscription_created: self.created_at,
            subscription_updated: self.updated_at
        }
    end
end