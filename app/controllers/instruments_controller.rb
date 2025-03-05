class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @instruments = Instrument.all

    # address is on the instrument's user
    @markers = @instruments.map(&:user).geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end

  end

  def show
    @instrument = Instrument.find(params[:id])
  end
end
