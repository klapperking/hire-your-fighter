import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hover"
export default class extends Controller {
  static targets = ["image", "strength", "defense", "speed"]

  connect() {
  }

  updateHover(event) {
    this.imageTarget.src = event.currentTarget.dataset.image
    this.strengthTarget.innerHTML = `<strong>Strength: ${event.currentTarget.dataset.strength}</strong>`
    this.defenseTarget.innerHTML = `<strong>Defense: ${event.currentTarget.dataset.defense}</strong>`
    this.speedTarget.innerHTML = `<strong>Speed: ${event.currentTarget.dataset.speed}</strong>`
  }
}
