import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="submit-booking"
export default class extends Controller {
  static targets = ["form"]

  connect() {
    console.log("connexion")
  }

  send(event) {
    event.preventDefault()
    console.log("youhou")
    console.log(this.element.action)
    fetch(this.formTarget.action, {
      method: "POST", // Could be dynamic with Stimulus values
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        if (data.success) {
          this.element.outerHTML = data.form
          console.log("true")
        }
        else {
          this.formTarget.outerHTML = data.form
          console.log("false")
        }
      })
  }
}
