alert('Mot de passe mis a jour avec succes.');
                            window.location.href = 'connexion1.php';

alert('Pseudo inexistant.');
                            history.back();

alert('Erreur lors de la réinitialisation : " . $e->getMessage() . "');
                        history.back();

alert('Les mots de passe ne correspondent pas.');
                    history.back();

alert('Veuillez remplir tous les champs.');
                history.back();

