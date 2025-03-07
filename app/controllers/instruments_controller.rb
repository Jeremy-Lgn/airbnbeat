class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @instruments = Instrument.all

    @instruments = Instrument.search_by_title(params[:query]) if params[:query].present?
    @inst_geocodeds = @instruments.select { |instrument| instrument.user.geocoded? }

    @markers = @inst_geocodeds.map do |inst_geocoded|
      {
        # address is on the user
        lat: inst_geocoded.user.latitude,
        lng: inst_geocoded.user.longitude,
        info_marker_html: render_to_string(partial: "info_marker", locals: {instrument: inst_geocoded}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
    @instrument = Instrument.find(params[:id])
    @booking = Booking.new
    @feedbacks = Feedback.joins(:booking).where(bookings: { instrument_id: @instrument.id })
    @average_rating = @feedbacks.average(:rating).to_f
  end

  def new
    @instrument = Instrument.new
    @user_name = current_user.name
    @user_instruments = current_user.instruments # Récupère les instruments de l'utilisateur
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
    params.require(:instrument).permit(:brand, :model, :description, :price_per_day, :title, photos: [])
  end

end
