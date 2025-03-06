class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]


  def my_instruments
    @instruments = current_user.instruments
    @user_name = current_user.name
  end

end
