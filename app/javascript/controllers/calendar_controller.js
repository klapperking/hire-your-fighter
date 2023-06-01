import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

// Connects to data-controller="calendar"
export default class extends Controller {
  connect() {
    console.log("hello");
    flatpickr(this.element, {
      altInput: true,
      plugins: [new rangePlugin({
        input: "#booking_expiration_date"
      })]
    })
  }

}
