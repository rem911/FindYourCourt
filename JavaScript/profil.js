function editEmail() {
        const emailSpan = document.getElementById('email');
        const emailText = emailSpan.textContent;
        emailSpan.innerHTML = `<input type="email" id="email-input" value="${emailText}">`;
        const editButton = document.querySelector('.edit-button[onclick="editEmail()"]');
        editButton.textContent = 'OK';
        editButton.setAttribute('onclick', 'saveEmail()');
    }

    function saveEmail() {
        const emailInput = document.getElementById('email-input');
        const newEmail = emailInput.value;

        // Appel AJAX pour mettre à jour l'email
        fetch('modif_profil.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ champ: 'email', valeur: newEmail })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                document.getElementById('email').textContent = newEmail;
                const editButton = document.querySelector('.edit-button[onclick="saveEmail()"]');
                editButton.textContent = 'Modifier mon email';
                editButton.setAttribute('onclick', 'editEmail()');
            } else {
                alert('Erreur : ' + data.error);
            }
        });
    }

    function editPseudo() {
        const pseudoSpan = document.getElementById('pseudo');
        const pseudoText = pseudoSpan.textContent;
        pseudoSpan.innerHTML = `<input type="text" id="pseudo-input" value="${pseudoText}">`;
        const editButton = document.querySelector('.edit-button[onclick="editPseudo()"]');
        editButton.textContent = 'OK';
        editButton.setAttribute('onclick', 'savePseudo()');
    }

    function savePseudo() {
        const pseudoInput = document.getElementById('pseudo-input');
        const newPseudo = pseudoInput.value;

        // Appel AJAX pour mettre à jour le pseudo
        fetch('modif_profil.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ champ: 'pseudo', valeur: newPseudo })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                document.getElementById('pseudo').textContent = newPseudo;
                const editButton = document.querySelector('.edit-button[onclick="savePseudo()"]');
                editButton.textContent = 'Modifier mon pseudo';
                editButton.setAttribute('onclick', 'editPseudo()');
            } else {
                alert('Erreur : ' + data.error);
            }
        });
    }

