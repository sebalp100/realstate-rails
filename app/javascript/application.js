// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

document.addEventListener('turbo:load', () => {
  const toggleButton = document.getElementById('toggleButton');
  const overlay = document.getElementById('overlay');
  const mobileMenu = document.getElementById('mobileMenu');
  const closeButton = document.getElementById('closeButton');

  function toggleMenu() {
    overlay.classList.toggle('hidden');
    mobileMenu.classList.toggle('hidden');
  }

  toggleButton.addEventListener('click', toggleMenu);
  overlay.addEventListener('click', toggleMenu);
  closeButton.addEventListener('click', toggleMenu);
});
