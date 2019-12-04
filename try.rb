require 'stripe'

# du site stripe:

def stripe_product_create
  Stripe.api_key = 'STRIPE_SECRET_KEY'

  Stripe::Product.create({
    name: 'T-shirt',
    type: 'good',
    description: 'Comfortable cotton t-shirt',
    attributes: ['size', 'gender'],
  })
  end

def stripe_customer_creation
  # Set your secret key: remember to change this to your live secret key in production
  # See your keys here: https://dashboard.stripe.com/account/apikeys
  Stripe.api_key = 'STRIPE_SECRET_KEY'

  customer = Stripe::Customer.create({
    email: 'jenny.rosen@example.com',
    payment_method: 'pm_1FWS6ZClCIKljWvsVCvkdyWg',
    invoice_settings: {
      default_payment_method: 'pm_1FWS6ZClCIKljWvsVCvkdyWg',
    },
  })
end

def stripe_customer_retrieve
  Stripe.api_key = 'STRIPE_SECRET_KEY'
  Stripe::Customer.retrieve('cus_GIEoFsPVo4Njr7')
end

def stripe_customer_update
  Stripe.api_key = 'STRIPE_SECRET_KEY'

  Stripe::Customer.update(
    'cus_GIEoFsPVo4Njr7',
    {metadata: {order_id: '6735'}},
  )
end

def stripe_customer_delete
  Stripe.api_key = 'STRIPE_SECRET_KEY'
  Stripe::Customer.delete('cus_GIEoFsPVo4Njr7')
end

def stripe_customer_all_list
  Stripe.api_key = 'STRIPE_SECRET_KEY'

  Stripe::Customer.list({limit: 3})
end


def stripe_subscription_creation
  # creation d un abonnement
  Stripe.api_key = 'STRIPE_SECRET_KEY'
  Stripe::Subscription.create( {
    customer: 'cus_GIEH88nS6r9xPH',
    items: [ { plan: 'plan_GIDRIFO3ktBxOk' }],
    })
end

def stripe_invoice_creation
  Stripe.api_key = 'STRIPE_SECRET_KEY'

  Stripe::Invoice.create({
    customer: 'cus_GIEHOEDnzogW5a',
  })
end

def stripe_invoice_retrieve
  Stripe.api_key = 'STRIPE_SECRET_KEY'

  Stripe::Invoice.retrieve(
    'in_1FldpGFQuC36cI611oGAiIlk',
  )
end

def stripe_invoice_update
  Stripe.api_key = 'STRIPE_SECRET_KEY'

  Stripe::Invoice.update(
    'in_1FldpGFQuC36cI611oGAiIlk',
    {metadata: {order_id: '6735'}},
  )
end

def stripe_charge_api
  # Set your secret key: remember to change this to your live secret key in production
  # See your keys here: https://dashboard.stripe.com/account/apikeys
  Stripe.api_key = 'STRIPE_SECRET_KEY'

  charge = Stripe::Charge.create({
    amount: 1000,
    currency: "eur",
    source: "tok_visa",
    transfer_data: {
      destination: "{{CONNECTED_STRIPE_ACCOUNT_ID}}",
    },
  })
end

def stripe_payment_api
  # Set your secret key: remember to change this to your live secret key in production
  # See your keys here: https://dashboard.stripe.com/account/apikeys
  Stripe.api_key = 'STRIPE_SECRET_KEY'

  payment_intent = Stripe::PaymentIntent.create({
    payment_method_types: ['card'],
    amount: 1000,
    currency: 'eur',
    transfer_data: {
      destination: '{{CONNECTED_STRIPE_ACCOUNT_ID}}',
    },
  })
end

def stripe_free_application
  # Set your secret key: remember to change this to your live secret key in production
  # See your keys here: https://dashboard.stripe.com/account/apikeys
  Stripe.api_key = 'STRIPE_SECRET_KEY'

  payment_intent = Stripe::PaymentIntent.create({
  payment_method_types: ['card'],
  amount: 1000,
  currency: 'eur',
  application_fee_amount: 123,
  transfer_data: {
  destination: '{{CONNECTED_STRIPE_ACCOUNT_ID}}',
  },
  })

end

def stripe_refunds_issuing
  # Set your secret key: remember to change this to your live secret key in production
  # See your keys here: https://dashboard.stripe.com/account/apikeys
  Stripe.api_key = 'STRIPE_SECRET_KEY'

  refund = Stripe::Refund.create({
    charge: '{CHARGE_ID}',
    reverse_transfer: true,
  })
end

def stripe_refunding_with_fees
  # Set your secret key: remember to change this to your live secret key in production
  # See your keys here: https://dashboard.stripe.com/account/apikeys
  Stripe.api_key = 'STRIPE_SECRET_KEY'

  refund = Stripe::Refund.create({
    charge: '{CHARGE_ID}',
    reverse_transfer: true,
    refund_application_fee: true,
  })
end



# essai N° 2

  def new
    # fait parti de l essai N 2

    Stripe.api_key = ENV['STRIPE_API_KEY']
    @plan = Stripe::Plan.retrieve(SubscriptionsToolkit::PREMIUM_PLAN_ID)
    # fin de l essai N 2 de cotisation new
  end

  def create
    response = init_stripe_session(current_user, subscription_params, SubscriptionsToolkit::PREMIUM_PLAN_ID)
    if response.success?
      flash[:notice] = 'You have successfully subscribed to our premium plan!'
    else
      flash[:alert] = 'Ooops, something went wrong!'
    end

    redirect_to root_path
  end

  def init_stripe_session(user, subscription_params, plan_id)
    begin
      #Always store your API key in environment variables
      Stripe.api_key = ENV["stripe_api_key"]

      customer = Stripe::Customer.create(subscription_params)
      stripe_subscription = customer.subscriptions.create({plan: plan_id})

      ServiceResponse.new(stripe_subscription)

    rescue Exception => e
      ServiceResponse.new(nil, false, 'Something went wrong!')
    end
  end

  private

    def subscription_params
      params[:source] = params[:stripeToken]
      params[:email] = params[:stripeEmail]

      params.permit(:source, :email)
    end

#########################################################""

        <%= form_tag subscriptions_path do %>
          <% if current_user.stripe_token %>
            <p class="text-center">
              <%= submit_tag t('premium.pay'), class: 'btn btn-primary btn-lg' %>
            </p>
          <% else %>
            <script src="https://checkout.stripe.com/checkout.js" class="stripe-button"
                data-key="<%= ENV['STRIPE_PUBLISHABLE_KEY'] %>"
                data-image="<%= image_url 'favicon.png' %>"
                data-name="iSignif SAS"
                data-description="Compte premium pendant un mois"
                data-email="<%= @cotisation.user.ser.email %>"
                data-locale="auto"></script>
          <% end %>
        <% end %>

code du cours:

        <script src="https://js.stripe.com/v3/"></script>
        <script>
          const paymentButton = document.getElementById('pay');
          paymentButton.addEventListener('click', () => {
            const stripe = Stripe('<%= ENV['STRIPE_PUBLISHABLE_KEY'] %>');
            stripe.redirectToCheckout({
              sessionId: '<%= @cotisation.checkout_session_id %>'
            });

          });
        </script>

##############################################################

code du cours:

        <script src="https://js.stripe.com/v3/"></script>
        <script>
          const paymentButton = document.getElementById('pay');
          paymentButton.addEventListener('click', () => {
            const stripe = Stripe('<%= ENV['STRIPE_PUBLISHABLE_KEY'] %>');
            stripe.redirectToCheckout({
              sessionId: '<%= @cotisation.checkout_session_id %>'
            });

          });
        </script>

##########################################################""

code trouvé à


        <%= form_tag subscriptions_path do %>
          <% if current_user.stripe_token %>
            <p class="text-center">
              <%= submit_tag t('premium.pay'), class: 'btn btn-primary btn-lg' %>
            </p>
          <% else %>
            <script src="https://checkout.stripe.com/checkout.js" class="stripe-button"
                data-key="<%= ENV['STRIPE_PUBLISHABLE_KEY'] %>"
                data-image="<%= image_url 'favicon.png' %>"
                data-name="iSignif SAS"
                data-description="Compte premium pendant un mois"
                data-email="<%= @cotisation.user.ser.email %>"
                data-locale="auto"></script>
          <% end %>
        <% end %>

###################################################################


















# objet stripe récupérer sur leur site pour voir
# n'a pas de raison d etre dans la zone private,
# seulement une question de lisibilité pour le reste
  def init_stripe_subsription_obj
    puts
      {
      "id": "sub_GICXgcVn3TOwVy",
      "object": "subscription",
      "application_fee_percent": null,
      "billing_cycle_anchor": 1575382403,
      "billing_thresholds": null,
      "cancel_at_period_end": false,
      "canceled_at": null,
      "collection_method": "charge_automatically",
      "created": 1575382403,
      "current_period_end": 1578060803,
      "current_period_start": 1575382403,
      "customer": "cus_3fB3EVLbaFLJc2",
      "days_until_due": null,
      "default_payment_method": null,
      "default_source": null,
      "default_tax_rates": [],
      "discount": null,
      "ended_at": null,
      "invoice_customer_balance_settings": {
        "consume_applied_balance_on_void": true
      },
      "items": {
        "object": "list",
        "data": [
          {
            "id": "si_GICXZAz1Guordr",
            "object": "subscription_item",
            "billing_thresholds": null,
            "created": 1575382403,
            "metadata": {},
            "plan": {
              "id": "gold",
              "object": "plan",
              "active": true,
              "aggregate_usage": null,
              "amount": 2000,
              "amount_decimal": "2000",
              "billing_scheme": "per_unit",
              "created": 1394785787,
              "currency": "eur",
              "interval": "month",
              "interval_count": 1,
              "livemode": false,
              "metadata": {},
              "nickname": null,
              "product": "prod_BUaRZD3X3zTkgL",
              "tiers": null,
              "tiers_mode": null,
              "transform_usage": null,
              "trial_period_days": null,
              "usage_type": "licensed"
            },
            "quantity": 1,
            "subscription": "sub_GICXgcVn3TOwVy",
            "tax_rates": []
          }
        ],
        "has_more": false,
        "url": "/v1/subscription_items?subscription=sub_GICXgcVn3TOwVy"
      },
      "latest_invoice": null,
      "livemode": false,
      "metadata": {},
      "next_pending_invoice_item_invoice": null,
      "pending_invoice_item_interval": null,
      "pending_setup_intent": null,
      "plan": {
        "id": "gold",
        "object": "plan",
        "active": true,
        "aggregate_usage": null,
        "amount": 2000,
        "amount_decimal": "2000",
        "billing_scheme": "per_unit",
        "created": 1394785787,
        "currency": "eur",
        "interval": "month",
        "interval_count": 1,
        "livemode": false,
        "metadata": {},
        "nickname": null,
        "product": "prod_BUaRZD3X3zTkgL",
        "tiers": null,
        "tiers_mode": null,
        "transform_usage": null,
        "trial_period_days": null,
        "usage_type": "licensed"
      },
      "quantity": 1,
      "start_date": 1575382403,
      "status": "active",
      "tax_percent": null,
      "trial_end": null,
      "trial_start": null
    }
  end
