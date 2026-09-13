<?php
function requireRole($allowed_roles) {
    if(!isset($_SESSION['role']) || !in_array($_SESSION['role'], $allowed_roles)) {
        echo '<div class="alert alert-danger m-4"><i class="bi bi-lock"></i> Aapko is page ki permission nahi hai. Sirf ' . implode(', ', $allowed_roles) . ' access kar sakte hain.</div>';
        require_once __DIR__ . '/footer.php';
        exit();
    }
}
?>