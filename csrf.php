<?php
function csrf_field() {
    if(empty($_SESSION['csrf_token'])) {
        $_SESSION['csrf_token'] = bin2hex(random_bytes(32));
    }
    return '<input type="hidden" name="csrf_token" value="' . $_SESSION['csrf_token'] . '">';
}

function csrf_verify() {
    if($_SERVER['REQUEST_METHOD'] == 'POST') {
        if(empty($_POST['csrf_token']) || empty($_SESSION['csrf_token']) || !hash_equals($_SESSION['csrf_token'], $_POST['csrf_token'])) {
            die('<div style="padding:40px;font-family:sans-serif;">Security check fail hua (session expire ho gaya ya invalid request). <a href="javascript:history.back()">Wapas jao</a> aur dubara try karo.</div>');
        }
    }
}
?>