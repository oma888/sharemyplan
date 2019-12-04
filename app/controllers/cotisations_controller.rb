class CotisationsController < ApplicationController
  def show
    @cotisation = Cotisation.find(params[:id])
    @subscription = @cotisation.subscription
    authorize @cotisation
  end

  def new
    @subscription = Subscription.find(params[:subscription_id])
    @cotisation = Cotisation.new
    authorize @cotisation
  end

  def init_payment
    image_path = ActionController::Base.helpers.asset_url(@cotisation.subscription.service.photo)
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @cotisation.subscription.name,
        images: ["#{request.base_url}#{image_path}"],
        amount: @cotisation.price_cents,
        currency: 'eur',
        quantity: 1
      }],
      customer_email: @cotisation.user.email,
      success_url: cotisation_url(@cotisation),
      cancel_url: cotisation_url(@cotisation)
    )
    @cotisation.update(checkout_session_id: session.id)
  end

  def create
    @subscription            = Subscription.find(params[:subscription_id])
    @cotisation              = Cotisation.new
    @cotisation.user         = current_user
    @cotisation.start_date   = Date.today
    @cotisation.subscription = @subscription
    @cotisation.state        = "pending"
    @cotisation.price_cents  = cotisation_price_per_month(@subscription.service)

    authorize @cotisation

    if @cotisation.save

      init_payment

      # session = Stripe::Checkout::Session.create(
      #   payment_method_types: ['card'],
      #   line_items: [{
      #     name: @cotisation.subscription.name,
      #     # images: [@cotisation.service.photo_url],
      #     # images: [@cotisation.service.photo_url],
      #     amount: @cotisation.price_cents,
      #     currency: 'eur',
      #     quantity: 1
      #   }],
      #   success_url: cotisation_url(@cotisation),
      #   cancel_url: cotisation_url(@cotisation)
      # )
      # @cotisation.update(checkout_session_id: session.id)

      cagnotte_update

      # @subscription.user.cagnotte += @subscription.price
      # @subscription.available_places = @subscription.available_places - 1
      # @subscription.save
      # @subscription.user.save

      @notification = Notification.create!(user: @subscription.user)
      notification

      redirect_to new_cotisation_payment_path(@cotisation)
    else
      render :new
    end
  end

  def cagnotte_update
    @subscription.user.cagnotte += @subscription.price
    @subscription.available_places = @subscription.available_places - 1
    @subscription.save
    @subscription.user.save
  end

  def destroy
    @cotisation = Cotisation.find(params[:id])
    authorize @cotisation
    @subscription = @cotisation.subscription
    @subscription.available_places += 1
    @subscription.save
    @cotisation.destroy

    redirect_to dashboard_path
  end

  def cotisation_price_per_month(service)
    (service.total_price * 100 / service.number_of_places) + 30
  end

  def suppression
    @cotisation = Cotisation.find(params[:id])
    authorize @cotisation
    @subscription = @cotisation.subscription
    @subscription.available_places += 1
    @subscription.save
    @cotisation.destroy
    redirect_to dashboard_path
  end

  private

  def params_cotisation
    params.require(:cotisation).permit(:start_date)
  end
end
