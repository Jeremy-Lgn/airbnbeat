class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
@instruments = Instrument.all
  end

  def show

  end

  def new
    @instrument = Instrument.new
    @user_name = current_user.name
  end



  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user = current_user
    @instrument.category = Category.find(params[:instrument][:category_id])

    if @instrument.save
      redirect_to @instrument, notice: 'Instrument créé.'
    else
      render :new, status: :unprocessable_entity
    end
  end





  private

  def instrument_params
    params.require(:instrument).permit(:brand, :model, :description, :price_per_day, :title)
  end

end
