import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hover"
export default class extends Controller {
  static targets = ["card", "image", "name", "strength", "defense", "speed"]

  connect() {
  }

  updateHover(event) {
    this.imageTarget.src = event.currentTarget.dataset.image
    this.cardTarget.style.backgroundImage = `${event.currentTarget.dataset.asseturl}` // FIX (Does not work but URL is correct.)
    this.nameTarget.innerHTML = `<strong>${event.currentTarget.dataset.name}</strong>`
    this.strengthTarget.innerHTML = `<strong>Strength: ${event.currentTarget.dataset.strength}</strong>`
    this.defenseTarget.innerHTML = `<strong>Defense: ${event.currentTarget.dataset.defense}</strong>`
    this.speedTarget.innerHTML = `<strong>Speed: ${event.currentTarget.dataset.speed}</strong>`
  }
}
