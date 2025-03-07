class FeedbacksController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @feedback = Feedback.new
  end
  def create
    @booking = Booking.find(params[:booking_id])
    @feedback = Feedback.new(feedback_params)
    @feedback.booking = @booking
    if @feedback.save
      redirect_to bookings_path, notice: "Votre avis a bien été enregistré."
    else
      redirect_to bookings_path, alert: "Erreur lors de l’enregistrement de votre avis."
    end
  end
  private
  def feedback_params
    params.require(:feedback).permit(:rating, :comment)
  end
end
