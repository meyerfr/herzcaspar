import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

flatpickr(".datepicker", {
  altInput: true,
  enableTime: true
})
console.log("hello from flatpickr")
