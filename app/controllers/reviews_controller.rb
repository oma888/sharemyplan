class ReviewsController < ApplicationController
  # def index
  #   @reviews = Review.all
  # end

  # def show
  #   @review = Review.find(params[:id])
  # end

  def new
    @cotisation        = Cotisation.find(params[:cotisation_id])
    @review            = Review.new
    @review.cotisation = @cotisation
    authorize @review
  end

  def create
    @review = Review.new(params_review)
    @cotisation = Cotisation.find(params[:cotisation_id])
    @review.cotisation = @cotisation
    authorize @review
    if @review.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def destroy
    authorize(@cotisation)
    @cotisation = Cotisation.find(params[:id])
    @cotisation.delete
    redirect_to cotisation_path
  end

  private

  def params_review
    params.require(:review).permit(:content, :rating)
  end
end
