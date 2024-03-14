import { Controller } from "@hotwired/stimulus"
import flatpickr from 'flatpickr';
import rangePlugin from 'flatpickr/dist/plugins/rangePlugin';

export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      minDate: 'today',
      mode: "range",
      inline: true,
      allowInput: false,
      "plugins": [new rangePlugin({ input: "#departure_date"})]
    })
  }
}
