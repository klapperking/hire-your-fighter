import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hover"
export default class extends Controller {
  static targets = ["image", "strength", "defense"]

  connect() {
  }

  updateHover(event) {
    this.imageTarget.src = event.currentTarget.dataset.image
    this.strengthTarget.innerText = `Strength: ${event.currentTarget.dataset.strength}`
    this.defenseTarget.innerText = `Defense: ${event.currentTarget.dataset.defense}`

  }
}
