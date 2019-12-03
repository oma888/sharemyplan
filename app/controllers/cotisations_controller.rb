class CotisationsController < ApplicationController
  def show
    @cotisation = Cotisation.find(params[:id])
    @subscription = @cotisation.subscription
    authorize @cotisation
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

  def new
    @subscription = Subscription.find(params[:subscription_id])
    @cotisation = Cotisation.new

    # essai 1 en place au niveau de l'abonnement des paiement stripe !

    # fait parti de l essai N 2
    # Stripe.api_key = ENV['STRIPE_API_KEY']
    # @plan = Stripe::Plan.retrieve(SubscriptionsToolkit::PREMIUM_PLAN_ID)
    # fin de l essai N 2 de cotisation new

    authorize @cotisation
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

      ###########
      # essai 1 abo #
      init_abo
      #############

      cagnotte_update

      @notification = Notification.create!(user: @subscription.user)
      notification

      redirect_to new_cotisation_payment_path(@cotisation)
    else
      render :new
    end
  end

  def cotisation_price_per_month(service)
    (service.total_price * 100 / service.number_of_places) + 30
  end

  def cagnotte_update
    @subscription.user.cagnotte += @subscription.price
    @subscription.available_places = @subscription.available_places - 1
    @subscription.save
    @subscription.user.save
  end

  def init_payment
    # n est pas appelee en ce moment mais fonctionne
    # fait partie du paiement standard vers stripe (pas de l abonnement !)
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @cotisation.subscription.name,
        # aucune image ne s'affiche dans cet écran, à relgler !!!!!!!!!!!!!!
        images: ['/assets/#{@cotisation.subscription.service.photo}'],
        # # images: ['#{@cotisation.subscription.service.photo}'],
        # images: [image_url '#{@cotisation.subscription.service.photo}'],
        # # images: [cl_image_tag(@cotisation.subscription.service.photo)],
        amount: @cotisation.price_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: cotisation_url(@cotisation),
      cancel_url: cotisation_url(@cotisation)
    )
    @cotisation.update(checkout_session_id: session.id)
  end

  ################### fin du code paiement classique

  #####################
  # suite essai 1  du appele dans create
  def init_abo
    customer = create_or_retrieve_customer(@cotisation.user)

    # Amount in cents
    @amount = @cotisation.price_cents

    begin
      # plante ici

      Stripe::Subscription.create( {
        customer: customer.id,
        items: [ { plan: 'plan_GIDRIFO3ktBxOk' }],
        })

      # Stripe::Subscription.create(customer: customer.id, items: [{ plan: ENV['STRIPE_SECRET_KEY'] }])
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_cotisation_payment_path(@cotisation)
    end
  end

  def create_or_retrieve_customer(user)
    # Try to retreive Stripe customer and create if not already registered
    customer = retrieve_stripe_customer(user)

    if customer.nil?
      customer = Stripe::Customer.create({
          email: user.email,
          payment_method:  'card',
          invoice_settings: { default_payment_method: 'card', },
          })

      user.update! stripe_token: customer.id
    end
    customer
  end

  def retrieve_stripe_customer(user)
    # @params [User]
    # @return [Stripe::Customer|Nil]
    return nil if user.stripe_token.nil?

    begin
      customer = Stripe::Customer.retrieve user.stripe_token
      return customer
    rescue Stripe::InvalidRequestError
      # if stripe token is invalid, remove it!
      user.update! stripe_token: nil
      return nil
    end
  end
  ### fin essai 1

  # essai 2
  def init_stripe_session(user, stripe_subscription_params, plan_id)

    begin
      #Always store your API key in environment variables
      Stripe.api_key = ENV['STRIPE_API_KEY']

      customer = Stripe::Customer.create(subscription_params)
      stripe_subscription = customer.subscriptions.create( { plan: plan_id })

      ServiceResponse.new(stripe_subscription)

    rescue Exception => e
      ServiceResponse.new(nil, false, 'Something went wrong!')
    end
  end

  def init_abo3
    Stripe.api_key = 'STRIPE_API_KEY'

    customer = Stripe::Customer.retrieve('cus_GIEoFsPVo4Njr7')




    customer = create_or_retrieve_customer(@cotisation.user)




    # Amount in cents
    @amount = @cotisation.price_cents

    begin
      # plante ici
      Stripe::Subscription.create(customer: customer.id, items: [{ plan: ENV['STRIPE_SECRET_KEY'] }])
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_cotisation_payment_path(@cotisation)
    end
  end







  private

  def stripe_subscription_params
    params[:source] = params[:stripeToken]
    params[:email] = params[:stripeEmail]

    # params.permit(:source, :email)
  end

  def params_cotisation
    params.require(:cotisation).permit(:start_date)
  end
end
