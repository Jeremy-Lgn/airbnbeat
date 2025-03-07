// toggle_form_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  toggle(event) {
    event.preventDefault();

    const targetId = event.currentTarget.dataset.target;
    const form = document.getElementById(targetId);

    if (form) {
      form.style.display = form.style.display === "none" ? "block" : "none";
    }
  }
}
