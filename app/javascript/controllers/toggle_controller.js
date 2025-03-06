import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["togglableElement", "buttonElement"]


  connect() {

  }

  fire() {
    this.togglableElementTarget.classList.toggle("d-none")
    this.buttonElementTarget.classList.toggle("d-none")
  }
}
