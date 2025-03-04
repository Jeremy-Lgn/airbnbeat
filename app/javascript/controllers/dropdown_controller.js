import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["toggle", "menu", "item"]

  toggle(event) {
    event.preventDefault()
    event.stopPropagation()

    const isExpanded = this.toggleTarget.getAttribute('aria-expanded') === 'true'
    this.toggleTarget.setAttribute('aria-expanded', !isExpanded)
  }
}
