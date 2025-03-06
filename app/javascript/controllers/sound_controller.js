// sound_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { url: String }

  connect() {
  }

  play(event) {
    event.stopPropagation()

    const audio = new Audio(this.urlValue)
    audio.play()
      .catch(error => {
        console.error("Erreur lors de la lecture du son:", error)
      })
  }
}
