// app/javascript/controllers/typed_js_controller.js
import { Controller } from "@hotwired/stimulus"
// Don't forget to import the NPM package
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    console.log("hello from the controller")
    new Typed(this.element, {
      strings: ["Change your life", "Watch Movies"],
      typeSpeed: 50,
      loop: true
    });
  }
}
