function toggleSidebar() {
  const sidebar = document.getElementById('sidebar');
  const content = document.getElementById('main-content');

  if (sidebar.style.width === '300px') {
    sidebar.style.width = '0';
    content.style.marginLeft = '0';
  } else {
    sidebar.style.width = '300px';
    content.style.marginLeft = '300px';
  }

  // Ocultar todos los submenús al abrir/cerrar el menú principal
  const subMenus = document.querySelectorAll('.sub-menu');
  subMenus.forEach(subMenu => {
    subMenu.style.maxHeight = null;
  });
  
  // Nueva función para gestionar los submenús
  function toggleSubMenu(link) {
    const subMenu = link.querySelector('.sub-menu');
  
    // Cerrar todos los submenús excepto el actual
    const subMenus = document.querySelectorAll('.sub-menu');
    subMenus.forEach(menu => {
      if (menu !== subMenu) {
        menu.style.maxHeight = null;
      }
    });
  
    // Alternar la visibilidad del submenú actual
    if (subMenu) {
      subMenu.style.maxHeight = subMenu.style.maxHeight ? null : subMenu.scrollHeight + 'px';
    }
  }
  
  // Obtener todos los enlaces con clase "menu-link" y agregar el evento clic
  const menuLinks = document.querySelectorAll('.menu-link');
  menuLinks.forEach(link => {
    link.addEventListener('click', () => toggleSubMenu(link));
  });
}
  