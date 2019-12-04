class SubscriptionsController < ApplicationController
  def index
    # @subscriptions = policy_scope(Subscription)
    # policy scope pas necessaire ici car pas de filtre par type de user

    @service            = Service.find(params[:service_id])
    # @subscriptions      = Subscription.where(service: @service).sort_by { |subscription| subscription.average_rating }.reverse
    # Refacto by Alex

    @subscriptions      = Subscription.where(service: @service).sort_by(&:average_rating).reverse

    @full_subscriptions = Subscription.where(service: @service).where(available_places: 0)
  end

  def new
    # @services = Service.select("category").group(:category)
    # @service = Service.where(:categroy => @services)
    # @options = Service.all.order(category: :asc)
    @user = current_user
    @service = Service.find(params[:service_id])
    @subscription = Subscription.new

    # TEST
    authorize(@subscription)
  end

  def create
    @subscription             = Subscription.new(subscription_params)
    @service                  = Service.find(params[:service_id])
    @subscription.user        = current_user
    @subscription.service     = @service

    # TEST
    authorize(@subscription)

    if @subscription.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
    @subscription = Subscription.find(params[:id])
    authorize(@subscription)
  end

  def edit
    @subscription = Subscription.find(params[:id])

    # TEST
    authorize(@subscription)
  end

  def update
    @subscription = Subscription.find(params[:id])

    authorize(@subscription)

    if @subscription.update(subscription_params)
      redirect_to subscription_path
    else
      render :edit
    end
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    authorize(@subscription)

    redirect_to dashboard_path
  end

  private

  def subscription_params
    params.require(:subscription).permit(:available_places, :identifiant, :password)
  end
end
