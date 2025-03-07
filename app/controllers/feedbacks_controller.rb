class FeedbacksController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])

    if Feedback.exists?(user_id: current_user.id, booking_id: @booking.id)
      redirect_to @booking, notice: "Vous avez deja laisser un avis"
    else
      @feedback = Feedback.new
    end
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @feedback = Feedback.new(feedback_params)
    @feedback.user_id = current_user.id
    @feedback.booking_id = @booking.id

    if @feedback.save
      redirect_to bookings_path, notice: "Votre avis a bien été enregistré."
    else
      redirect_to bookings_path, alert: "Erreur lors de l'enregistrement de votre avis."
    end
  end



  private

  def feedback_params
    params.require(:feedback).permit(:rating, :comment)
  end
end
