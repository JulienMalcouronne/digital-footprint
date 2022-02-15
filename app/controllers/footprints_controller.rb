class FootprintsController < ApplicationController
  before_action :set_footprint, only: %i[show]

  def index
    @footprints = policy_scope(Footprint)
  end

  def new
    @footprint = Footprint.new
    authorize @footprint
  end

  def create
    @footprint = Footprint.new(footprint_params)
    @footprint.user = current_user
    authorize @footprint

    if @footprint.save
      @footprint.carbon_footprint = recalculate_footprint
      @footprint.save
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

  def recalculate_footprint
      if @footprint.country == "France"
        area = 59
      elsif @footprint.country == "USA"
        area = 447
      else
        area = 596
      end

      if @footprint.terminal_category == "phone"
        terminal = 1.1**-4
      else
        terminal = 3.2**-4
      end
      @footprint.carbon_footprint = @footprint.data_size * (7.2**-11 + 1.52**-10)* 59 + @footprint.duration_on_terminal * terminal * area * @footprint.additional_factor
    end
end
