class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :service
  has_many :cotisations, dependent: :destroy
  has_many :reviews, through: :cotisations

  validates :available_places, presence: true
  validates :identifiant, presence: true
  validates :password, presence: true

  def name
    self.service.name
  end

  def price
    self.service.total_price.fdiv(self.service.number_of_places).round(2)
  end

  def average_rating
    return 0 if self.reviews.blank?
    self.reviews.average(:rating)

  end
end
