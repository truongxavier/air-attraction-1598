import { Controller } from "@hotwired/stimulus"
import flatpickr from 'flatpickr';
import rangePlugin from 'flatpickr/dist/plugins/rangePlugin';

export default class extends Controller {
  static targets = ["enddate", "totalprice", "startdate", "peoples"]
  static values = {
    price: Number,
    dates: Array
  }

  connect() {
    const disabledDates = this.datesValue.map(date => ({
      from: date.arrival_date,
      to: date.departure_date
    }));

    flatpickr(this.startdateTarget, {
      minDate: 'today',
      mode: "range",
      inline: true,
      disable: disabledDates,
      allowInput: false,
      "plugins": [new rangePlugin({ input: "#departure_date"})]
    })
  }

  test(event) {
    let start_date = this.startdateTarget.value
    let end_date = this.enddateTarget.value
    console.log(this.startdateTarget)
    let number_personne = this.peoplesTarget.value
    if (end_date) {
      start_date = new Date(start_date)
      end_date = new Date(end_date)
      console.log(start_date)
      const daysnumber = (end_date - start_date) / 1000 / 60 / 60 / 24 + 1
      const price_per_day = this.priceValue
      let result = price_per_day*daysnumber*number_personne
      this.totalpriceTarget.innerHTML = `
        <div class="border mx-2 border-primary mt-2 p-1">
          <p>${price_per_day}$ x ${daysnumber} days x ${number_personne}</p>
          <hr />
          <h5 class="mt-2">total: ${result.toLocaleString()}$</h5>
        </div>
      `
    }
  }
}
