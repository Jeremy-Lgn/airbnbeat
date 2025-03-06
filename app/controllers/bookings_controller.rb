class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @instrument = Instrument.find(params[:instrument_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @instrument = Instrument.find(params[:instrument_id])
    @booking.instrument = @instrument
    @booking.user = current_user

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @instrument, notice: "Booking was successfully created." }
      else
        format.html { render "instruments/show", status: :unprocessable_entity }
      end
      format.json
    end
  end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
