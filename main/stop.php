<?php
shell_exec("sudo systemctl stop nginx");
header("Location: index.php");
?>
