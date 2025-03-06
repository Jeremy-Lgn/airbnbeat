// toggle_form_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  toggle(event) {
    event.preventDefault(); // Prevent the default action
    console.log("Toggle action triggered"); // Debugging statement

    const targetId = event.currentTarget.dataset.target; // Get the target ID from button’s data-target
    const form = document.getElementById(targetId); // Find the form by its ID

    if (form) {
      console.log("Found form:", targetId); // Debugging statement
      form.style.display = (form.style.display === "none" || form.style.display === "") ? "block" : "none";
    } else {
      console.error("Form not found for ID:", targetId); // Log error for debugging
    }
  }
}
