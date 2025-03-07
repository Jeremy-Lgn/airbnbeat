import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="submit-booking"
export default class extends Controller {
  static targets = ["form", "successMessage", "bookingForm"]

  connect() {

  }

  send(event) {
    event.preventDefault()

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        if (data.success) {
          this.bookingFormTarget.classList.add("d-none")
          this.successMessageTarget.classList.remove("d-none")
        }
        else {
          this.formTarget.outerHTML = data.form
        }
      })
  }
}
