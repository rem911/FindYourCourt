<?php
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Vérifiez si l'utilisateur est connecté
if (!isset($_SESSION['idutilisateur'])) {
    echo "Erreur : L'utilisateur n'est pas connecté.";
    exit();
}

// Inclure la connexion
require 'connexion.php';

// Vérifiez que la connexion fonctionne
if (!$conn) {
    echo "Erreur de connexion à la base de données : " . $conn->connect_error;
    exit();
}

// Récupérer l'ID utilisateur depuis la session
$idutilisateur = $_SESSION['idutilisateur'];

// Étape 1 : Vérifiez si l'utilisateur existe
$check_sql = "SELECT * FROM utilisateur WHERE idutilisateur = ?";
$check_stmt = $conn->prepare($check_sql);

if (!$check_stmt) {
    echo "Erreur SQL (préparation SELECT) : " . $conn->error;
    exit();
}

$check_stmt->bind_param("i", $idutilisateur);
$check_stmt->execute();
$result = $check_stmt->get_result();

if ($result->num_rows === 0) {
    echo "Erreur : Aucun utilisateur trouvé avec cet ID.";
    exit();
}

// Étape 2 : Supprimez l'utilisateur
$sql = "DELETE FROM utilisateur WHERE idutilisateur = ?";
$stmt = $conn->prepare($sql);

if (!$stmt) {
    echo "Erreur SQL (préparation DELETE) : " . $conn->error;
    exit();
}

$stmt->bind_param("i", $idutilisateur);

if ($stmt->execute()) {
    session_destroy();
    echo "Compte supprimé avec succès.";
} else {
    echo "Erreur SQL lors de la suppression : " . $stmt->error;
}

// Fermez les connexions
$stmt->close();
$conn->close();
?>
