class StripeCheckoutSessionService
  def call(event)
    cotisation = Cotisation.find_by(checkout_session_id: event.data.object.id)
    cotisation.update(state: 'paid')
  #   @subscription = cotisation.subscription
  #   @user = @subscription.user

  #   @user.cagnotte += @subscription.price
  #   @subscription.available_places -= 1

  #   @subscription.save
  #   @user.save
  # end
end
