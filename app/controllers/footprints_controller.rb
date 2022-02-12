class FootprintsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :index
  before_action :set_footprint, only: %i[show]

  def index
    @footprints = policy_scope(Footprint)
    # @user = current_user
  end

  def new
    @footprint = Footprint.new
    authorize @footprint
  end

  def create
    @footprint = Footprint.new(footprint_params)
    @footprint.user = current_user
    authorize @footprint

    if @footprint.save!

      redirect_to @footprint, notice: 'Your digital carbon footprints has been created'
    else
      render :new
    end
  end

  def show
  end

  private

  def set_footprint
    @footprint = Footprint.find(params[:id])
    authorize @footprint
  end

  def footprint_params
    params.require(:footprint).permit(:duration_on_terminal, :terminal_category, :data_size, :country)
  end
end
