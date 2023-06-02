import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hover"
export default class extends Controller {
  static targets = ["card", "image", "name", "strength", "defense", "speed"]

  connect() {
  }

  updateHover(event) {

    // update Image and Background with appropriate card
    this.imageTarget.src = event.currentTarget.dataset.image
    this.cardTarget.style.backgroundImage = `url(${event.currentTarget.dataset.asseturl})`

    // update fighter stats with the hovered stats
    this.nameTarget.innerHTML = `<strong>${event.currentTarget.dataset.name}</strong>`
    this.strengthTarget.innerHTML = `<strong>Strength: ${event.currentTarget.dataset.strength}</strong>`
    this.defenseTarget.innerHTML = `<strong>Defense: ${event.currentTarget.dataset.defense}</strong>`
    this.speedTarget.innerHTML = `<strong>Speed: ${event.currentTarget.dataset.speed}</strong>`
  }
}
