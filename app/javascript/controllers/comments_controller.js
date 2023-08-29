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
    const editButtonID = event.params["edit"]

    //console.log("ID is : " + formID)
    const form = document.getElementById(formID)
    const commentBody = document.getElementById(commentBodyID)
    const editButton = document.getElementById(editButtonID)

    form.classList.toggle("d-none")
    form.classList.toggle("mt-5")
    commentBody.classList.toggle("d-none")
    this.toggleEditButton(editButton)
  }
  toggleEditButton(editButton){
    if (editButton.innerText === "Edit") {
      editButton.innerText = "Cancel"
      this.toggleEditButtonClass(editButton)
    } else {
      editButton.innerText = "Edit"
      this.toggleEditButtonClass(editButton)
    }
  }
  toggleEditButtonClass(editButton){
    editButton.classList.toggle("btn-secondary")
    editButton.classList.toggle("btn-warning")
  }
}
