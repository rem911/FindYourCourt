<?php
// Démarrer la session
session_start();

// Vérifier si l'utilisateur est connecté
if (!isset($_SESSION['idutilisateur'])) {
    echo json_encode(['success' => false, 'error' => 'Utilisateur non connecté.']);
    exit;
}

// Inclure la connexion à la base de données
require 'connexion.php';

// Récupérer les données envoyées par AJAX
$data = json_decode(file_get_contents('php://input'), true);
$champ = htmlspecialchars($data['champ']);
$valeur = htmlspecialchars($data['valeur']);

// Valider le champ à modifier
if (!in_array($champ, ['email', 'pseudo'])) {
    echo json_encode(['success' => false, 'error' => 'Modification non autorisée.']);
    exit;
}

// Préparer la requête de mise à jour
try {
    $stmt = $pdo->prepare("UPDATE utilisateur SET $champ = :valeur WHERE idutilisateur = :id");
    $stmt->bindParam(':valeur', $valeur);
    $stmt->bindParam(':id', $_SESSION['idutilisateur']);
    $stmt->execute();
    $_SESSION[$champ] = $valeur;


    echo json_encode(['success' => true]);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
}
