import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["startDate", "endDate", "duration", "totalPrice", "calculationBox"]
  static values = { price: Number }

  connect() {
    if (this.startDateTarget.value && this.endDateTarget.value) {
      this.updateCalculation();
    }
  }

  updateCalculation() {
    if (!this.startDateTarget.value || !this.endDateTarget.value) {
      this.calculationBoxTarget.classList.add("d-none");
      return;
    }

    const startDate = new Date(this.startDateTarget.value);
    const endDate = new Date(this.endDateTarget.value);

    const diffTime = endDate - startDate;

    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)) + 1;

    const totalPrice = (diffDays * this.priceValue) + (this.priceValue);

    this.durationTarget.textContent = diffDays;
    this.totalPriceTarget.textContent = totalPrice.toFixed(2);
    this.calculationBoxTarget.classList.remove("d-none", "alert-danger");
    this.calculationBoxTarget.classList.add("alert-info");
  }
}
