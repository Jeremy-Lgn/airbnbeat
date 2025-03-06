import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  toggle(event) {
    event.preventDefault();

    const targetId = event.currentTarget.dataset.target;
    const form = document.getElementById(targetId);


    if (form.style.display === "none" || form.style.display === "") {
      form.style.display = "block";
    } else {
      form.style.display = "none";
    }
  }
}
