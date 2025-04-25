document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('loginForm');
    const messageDiv = document.getElementById('message');

    form.addEventListener('submit', function (e) {
        e.preventDefault(); // Empêcher le rechargement de la page

        const formData = new FormData(form);

        // Envoi de la requête AJAX
        fetch('api_connexion.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // Si la connexion réussit, rediriger l'utilisateur
                messageDiv.style.color = 'green';
                messageDiv.textContent = data.message;

                setTimeout(() => {
                    window.location.href = 'accueil.php';
                }, 2000);
            } else {
                // Afficher les erreurs
                messageDiv.style.color = 'red';
                messageDiv.textContent = data.message;
            }
        })
        .catch(error => {
            console.error('Erreur lors de la connexion:', error);
            messageDiv.style.color = 'red';
            messageDiv.textContent = "Une erreur est survenue. Veuillez réessayer.";
        });
    });
});
