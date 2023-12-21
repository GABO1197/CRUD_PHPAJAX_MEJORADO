document.addEventListener('DOMContentLoaded', function () {
    var profileTrigger = document.getElementById('profile-trigger');
    var profileMenu = document.getElementById('profile-menu');

    profileTrigger.addEventListener('click', function (event) {
        // Detenemos la propagación del evento para evitar que se cierre inmediatamente
        event.stopPropagation();

        // Alternamos la visibilidad del menú
        if (profileMenu.style.display === 'none' || profileMenu.style.display === '') {
            profileMenu.style.display = 'block';
        } else {
            profileMenu.style.display = 'none';
        }
    });

    // Cierra el menú cuando se hace clic en cualquier parte fuera del menú
    document.addEventListener('click', function () {
        profileMenu.style.display = 'none';
    });

    // Evita que el clic dentro del menú cierre el menú
    profileMenu.addEventListener('click', function (event) {
        event.stopPropagation();
    });
});