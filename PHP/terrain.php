<?php
header('Content-Type: application/json');
session_start();

// Connexion à la base de données
$host = 'localhost';
$username = 'root';
$password = '';
$database = 'findyourcourt';
$conn = new mysqli($host, $username, $password, $database);


if ($conn->connect_error) {
    echo json_encode(['success' => false, 'message' => 'Erreur de connexion : ' . $conn->connect_error]);
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $idutilisateur = isset($_SESSION['idutilisateur']) ? intval($_SESSION['idutilisateur']) : null;
    $idterrain = isset($_POST['idterrain']) ? $conn->real_escape_string($_POST['idterrain']) : null;
    $horaire = isset($_POST['horaire']) ? $conn->real_escape_string($_POST['horaire']) : null;
    $date_reservation = isset($_POST['date_reservation']) ? $conn->real_escape_string($_POST['date_reservation']) : null;

    if (!$idutilisateur || !$idterrain || !$horaire || !$date_reservation) {
        echo json_encode(['success' => false, 'message' => 'Veuillez remplir tous les champs.']);
        exit();
    }

    $stmt = $conn->prepare("INSERT INTO reservation (idutilisateur, idterrain, horaire, date_reservation) VALUES (?, ?, ?, ?)");
    if (!$stmt) {
        echo json_encode(['success' => false, 'message' => 'Erreur dans la préparation de la requête : ' . $conn->error]);
        exit();
    }

    $stmt->bind_param("iiss", $idutilisateur, $idterrain, $horaire, $date_reservation);

    if ($stmt->execute()) {
        echo json_encode(['success' => true, 'message' => 'Réservation effectuée avec succès.']);
    } else {
        echo json_encode(['success' => false, 'message' => 'Erreur lors de la réservation : ' . $stmt->error]);
    }

    $stmt->close();
} else {
    echo json_encode(['success' => false, 'message' => 'Aucune donnée reçue.']);
}

$conn->close();
?>
