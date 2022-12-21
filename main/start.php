<?php
shell_exec("sudo systemctl start nginx");
header("Location: index.php");
?>
