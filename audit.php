<?php
function logAudit($conn, $user_id, $entity_type, $entity_id, $action, $old_value = null, $new_value = null) {
    $ip_address = $_SERVER['REMOTE_ADDR'] ?? '127.0.0.1';
    $old_json = $old_value ? json_encode($old_value) : null;
    $new_json = $new_value ? json_encode($new_value) : null;

    $stmt = mysqli_prepare($conn, "INSERT INTO audit_log (user_id, entity_type, entity_id, action, old_value, new_value, ip_address) VALUES (?, ?, ?, ?, ?, ?, ?)");
    mysqli_stmt_bind_param($stmt, "isissss", $user_id, $entity_type, $entity_id, $action, $old_json, $new_json, $ip_address);
    mysqli_stmt_execute($stmt);
}
?>