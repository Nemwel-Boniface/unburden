document.addEventListener('DOMContentLoaded', () => {
  document.getElementById('navbar-toggle').onclick = function() {
    var menu = document.getElementById('navbar-menu');
    if (menu.classList.contains('hidden')) {
      menu.classList.remove('hidden');
    } else {
      menu.classList.add('hidden');
    }
  }
});