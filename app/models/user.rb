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
end
