class User < ApplicationRecord
    has_secure_password
    has_many :subscriptions
    validates :email, presence: true, uniqueness: true
end
