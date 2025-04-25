<?php
// Activer les erreurs pour le débogage
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Inclure le fichier de connexion à la base de données
include('connexion.php');

// Vérifier si le formulaire est soumis
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Récupérer et sécuriser les champs du formulaire
    $prenom = htmlspecialchars(trim($_POST['Prénom']));
    $nom = htmlspecialchars(trim($_POST['nom']));
    $email = htmlspecialchars(trim($_POST['email']));
    $adresse = htmlspecialchars(trim($_POST['adresse']));
    $dateNaissance = htmlspecialchars(trim($_POST['date-naissance']));
    $téléphone = htmlspecialchars(trim($_POST['téléphone']));
    $pseudo = htmlspecialchars(trim($_POST['pseudo']));
    $motDePasse = htmlspecialchars(trim($_POST['mot_de_passe']));
    $niveau = htmlspecialchars(trim($_POST['niveau']));
    $poste = htmlspecialchars(trim($_POST['poste']));

    // Valider les champs requis
    if (empty($prenom) || empty($nom) || empty($email) || empty($téléphone) || empty($motDePasse)) {
        echo "<p style='color:red;'>Tous les champs obligatoires doivent être remplis.</p>";
        exit;
    }

    // Valider l'adresse e-mail
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo "<p style='color:red;'>Adresse e-mail invalide.</p>";
        exit;
    }

    // Hash du mot de passe
    $motDePasseHash = password_hash($motDePasse, PASSWORD_DEFAULT);

    // Insertion dans la base de données
    try {
        $sql = "INSERT INTO utilisateur (prenom, nom, email, adresse, date_naissance, telephone, pseudo, mot_de_passe, niveau, poste)
                VALUES (:prenom, :nom, :email, :adresse, :dateNaissance, :telephone, :pseudo, :motDePasse, :niveau, :poste)";
        $stmt = $pdo->prepare($sql);
        $stmt->execute([
            ':prenom' => $prenom,
            ':nom' => $nom,
            ':email' => $email,
            ':adresse' => $adresse,
            ':dateNaissance' => $dateNaissance,
            ':telephone' => $téléphone,
            ':pseudo' => $pseudo,
            ':motDePasse' => $motDePasseHash,
            ':niveau' => $niveau,
            ':poste' => $poste
        ]);

        // Rediriger vers la page de connexion après l'inscription
        header('Location: connexion1.php');
        exit;
    } catch (PDOException $e) {
        echo "<p style='color:red;'>Erreur lors de l'inscription : " . $e->getMessage() . "</p>";
    }
} else {
    echo "<p>Accès non autorisé. Veuillez soumettre le formulaire.</p>";
}
