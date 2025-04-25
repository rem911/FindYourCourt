<?php
session_start();
session_destroy();
header("Location: accueil2.html");
exit();
?>
