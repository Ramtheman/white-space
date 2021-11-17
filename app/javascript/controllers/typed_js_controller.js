// app/javascript/controllers/typed_js_controller.js
import { Controller } from "@hotwired/stimulus";
// Don't forget to import the NPM package
import Typed from "typed.js";

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ['Welcome to White|Space. ^1700 The adverts people. ^1000'],
      typeSpeed: 50,
      loop: true
    });
  }
}
