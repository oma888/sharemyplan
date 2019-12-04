class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @services    = Service.all.order(:category).reverse
    @user_choice = params[:user_choice]
  end

  def supp
    @cotisation = Cotisation.find(params[:id])
    authorize @cotisation
    @cotisation.destroy
    redirect_to subscription_path
  end
end
