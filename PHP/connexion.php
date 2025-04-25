<?php
// Paramètres de connexion
$host = 'localhost';
$username = 'root';
$password = '';
$database = 'findyourcourt';

try {
    // Connexion avec PDO
    $pdo = new PDO("mysql:host=$host;dbname=$database;charset=utf8", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erreur de connexion à la base de données avec PDO : " . $e->getMessage());
}

// Connexion avec MySQLi
$conn = new mysqli($host, $username, $password, $database);

// Vérifiez la connexion MySQLi
if ($conn->connect_error) {
    die("Erreur de connexion à la base de données avec MySQLi : " . $conn->connect_error);
}
?>
