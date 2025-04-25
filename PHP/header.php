<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
?>

<header class="header">
    <div class="header-content">
        <div class="header-container">
            <img src="image/logo.png" alt="Logo FindYourCourt" class="logo">
            <h1>FINDYOURCOURT</h1>
            <ul>
                <?php if (isset($_SESSION['idutilisateur'])): ?>
                    <li><a href="accueil.php">Accueil</a></li>
                <?php endif; ?>
            </ul>
        </div>
    </div>
</header>
