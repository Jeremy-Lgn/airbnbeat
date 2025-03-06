if @booking.persisted?
  json.success true
  json.form render(
    partial: "bookings/success_booking",
    formats: :html
  )
else
  json.success false
  json.form render(
    partial: "bookings/form_booking",
    formats: :html,
    locals: {
      booking: @booking
    }
  )
end
