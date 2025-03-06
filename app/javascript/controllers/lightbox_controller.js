import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["image", "overlay"]

  open(event) {

    const fullImageUrl = event.currentTarget.src

    this.imageTarget.src = fullImageUrl
    this.overlayTarget.classList.remove("hidden")
  }

  close() {
    this.overlayTarget.classList.add("hidden")
  }

  stopPropagation(event) {
    event.stopPropagation()
  }
}
