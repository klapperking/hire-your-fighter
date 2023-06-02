import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hover"
export default class extends Controller {
  static targets = ["card", "image", "name", "strength", "defense", "speed", "description"]

  connect() {
  }

  updateHover(event) {

    // update Image and Background with appropriate card
    this.imageTarget.src = event.currentTarget.dataset.image
    this.cardTarget.style.backgroundImage = `url(${event.currentTarget.dataset.asseturl})`

    // update fighter stats with the hovered stats
    this.nameTarget.innerHTML = `${event.currentTarget.dataset.name}`
    this.descriptionTarget.innerHTML = ` ${event.currentTarget.dataset.description}`
    this.strengthTarget.innerHTML = `<i class="fa-solid fa-hand-fist" style="color: #000000;"></i> ${event.currentTarget.dataset.strength}`
    this.defenseTarget.innerHTML = `<i class="fa-solid fa-shield" style="color: #000000;"></i> ${event.currentTarget.dataset.defense}`
    this.speedTarget.innerHTML = `<i class="fa-solid fa-person-running" style="color: #000000;"></i> ${event.currentTarget.dataset.speed}`
  }
}
