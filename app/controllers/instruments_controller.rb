class InstrumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
@instruments = Instrument.all
  end

  def show

  end
end
