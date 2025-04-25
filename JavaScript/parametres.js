document.getElementById('logout').addEventListener('click', function () {
            if (confirm('Souhaitez-vous vraiment vous déconnecter ?')) {
                window.location.href = 'logout.php';
            }
        });

        document.getElementById('delete-account').addEventListener('click', function () {
            if (confirm('Souhaitez-vous vraiment supprimer votre compte ? Cette action est irréversible.')) {
                fetch('delete_account.php', {
                    method: 'POST'
                })
                .then(response => {
                    if (!response.ok) {
                        throw new Error(`Erreur réseau : ${response.status} ${response.statusText}`);
                    }
                    return response.text();
                })
                .then(data => {
                    alert(data);
                    if (data.includes("Compte supprimé avec succès")) {
                        window.location.href = 'accueil2.html';
                    }
                })
                .catch(error => {
                    console.error('Erreur technique détectée :', error);
                    alert(`Une erreur technique est survenue : ${error.message}. Consultez la console pour plus de détails.`);
                });
            }
        });

