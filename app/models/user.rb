class User < ApplicationRecord
  before_create :increment_premium
  mount_uploader :photo, PhotoUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :subscriptions
  has_many :cotisations
  has_many :orders
  has_many :reviews
  has_many :notifications

  def increment_premium
    if premium_until.nil? || (premium_until < Date.today)
      self.premium_until = Date.today
    end
    # self.premium_until += 1.month
  end

  def create_or_retrieve_customer
    # Try to retreive Stripe customer and create if not already registered
    customer = self.retrieve_stripe_customer

    if customer.nil?
      customer = Stripe::Customer.create({
          name: self.first_name + ' ' + self.first_name,
          email: self.email
          # payment_method:  ['card'],
          # invoice_settings: { default_payment_method: 'card', },
          })

      self.update! stripe_token: customer.id
    end
    customer
  end

  def retrieve_stripe_customer
    return nil if self.stripe_token.nil?

    begin
      stripe_customer = Stripe::Customer.retrieve user.stripe_token
    rescue Stripe::InvalidRequestError
      # if stripe token is invalid, remove it!
      self.update! stripe_token: nil
      return nil
    end
    stripe_customer
  end
end
