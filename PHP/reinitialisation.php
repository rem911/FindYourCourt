<?php
require 'connexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $pseudo = htmlspecialchars(trim($_POST['pseudo']));
    $newPassword = htmlspecialchars(trim($_POST['new-password']));
    $confirmPassword = htmlspecialchars(trim($_POST['confirm-password']));

    if (!empty($pseudo) && !empty($newPassword) && !empty($confirmPassword)) {
        if ($newPassword === $confirmPassword) {
            try {
                $stmt = $pdo->prepare("SELECT idutilisateur FROM utilisateur WHERE LOWER(pseudo) = LOWER(:pseudo)");
                $stmt->bindParam(':pseudo', $pseudo);
                $stmt->execute();
                $user = $stmt->fetch(PDO::FETCH_ASSOC);

                if ($user) {
                    $hashedPassword = password_hash($newPassword, PASSWORD_DEFAULT);
                    $updateStmt = $pdo->prepare("UPDATE utilisateur SET mot_de_passe = :newPassword WHERE idutilisateur = :id");
                    $updateStmt->bindParam(':newPassword', $hashedPassword);
                    $updateStmt->bindParam(':id', $user['idutilisateur']);
                    $updateStmt->execute();

                    echo "
                        <script>
                            alert('Mot de passe mis a jour avec succes.');
                            window.location.href = 'connexion1.php';
                        </script>
                    ";
                } else {
                    echo "
                        <script>
                            alert('Pseudo inexistant.');
                            history.back();
                        </script>
                    ";
                }
            } catch (PDOException $e) {
                echo "
                    <script>
                        alert('Erreur lors de la réinitialisation : " . $e->getMessage() . "');
                        history.back();
                    </script>
                ";
            }
        } else {
            echo "
                <script>
                    alert('Les mots de passe ne correspondent pas.');
                    history.back();
                </script>
            ";
        }
    } else {
        echo "
            <script>
                alert('Veuillez remplir tous les champs.');
                history.back();
            </script>
        ";
    }
}
?>
