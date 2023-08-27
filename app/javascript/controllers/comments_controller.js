import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  initialize() {
    //console.log("Initialized")
  }
  connect() {
    //console.log("Hello, World")
  }
  toggleForm(event) {
    console.log("I clicked edit button")
    event.preventDefault()
    event.stopPropagation()
    const formID = event.params["form"]
    const commentBodyID = event.params["body"]
    console.log("ID is : " + formID)
    const form = document.getElementById(formID)
    form.classList.toggle("d-none")
    form.classList.toggle("mt-5")
    const commentBody = document.getElementById(commentBodyID)
    commentBody.classList.toggle("d-none")
  }
}
