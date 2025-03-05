class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @instruments = Instrument.all
    @inst_geocodeds = @instruments.select { |instrument| instrument.user.geocoded? }

    @markers = @inst_geocodeds.map do |inst_geocoded|
      {
        # address is on the user
        lat: inst_geocoded.user.latitude,
        lng: inst_geocoded.user.longitude,
        info_marker_html: render_to_string(partial: "info_marker", locals: {instrument: inst_geocoded})
      }
    end
  end

  def show
    @instrument = Instrument.find(params[:id])
  end
end
