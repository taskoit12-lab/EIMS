<?php
//error_reporting(E_ALL);
//ini_set('display_errors', 1);
session_start();
require_once 'includes/csrf.php';

if(isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit();
}

$error = "";

if($_SERVER['REQUEST_METHOD'] == 'POST') {
    csrf_verify();
    require_once 'config/database.php';
    
    $email = trim($_POST['email']);
    $password = $_POST['password'];
    
    if(empty($email) || empty($password)) {
        $error = "Email aur password dono zaroori hain!";
    } else {
        $conn = getConnection();
        
        $sql = "SELECT * FROM users WHERE email = ? AND status = 'ACTIVE'";
        $stmt = mysqli_prepare($conn, $sql);
        mysqli_stmt_bind_param($stmt, "s", $email);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);
        
        if($row = mysqli_fetch_assoc($result)) {
            if(password_verify($password, $row['password'])) {
                session_regenerate_id(true);
                $_SESSION['user_id'] = $row['user_id'];
                $_SESSION['full_name'] = $row['full_name'];
                $_SESSION['role'] = $row['role'];
                
                $update = "UPDATE users SET last_login_at = NOW() WHERE user_id = ?";
                $ustmt = mysqli_prepare($conn, $update);
                mysqli_stmt_bind_param($ustmt, "i", $row['user_id']);
                mysqli_stmt_execute($ustmt);
                
                header("Location: index.php");
                exit();
            } else {
                $error = "Email ya password galat hai!";
            }
        } else {
            $error = "Email ya password galat hai!";
        }
        mysqli_close($conn);
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EIMS - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f2f5;
        }
        .login-card {
            margin-top: 100px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
        .login-header {
            background-color: #2c3e50;
            color: white;
            border-radius: 15px 15px 0 0;
            padding: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card login-card">
                    <div class="login-header">
                        <h3>📦 EIMS</h3>
                        <p class="mb-0">Enterprise Inventory Management System</p>
                    </div>
                    <div class="card-body p-4">
                        <?php if($error): ?>
                            <div class="alert alert-danger">
                                <?php echo $error; ?>
                            </div>
                        <?php endif; ?>
                        
                        <form method="POST">
                            <?php echo csrf_field(); ?>
                            <div class="mb-3">
                                <label class="form-label">Email Address</label>
                                <input type="email" name="email" class="form-control" placeholder="Enter email" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input type="password" name="password" class="form-control" placeholder="Enter password" required>
                            </div>
                            <button type="submit" class="btn btn-dark w-100">Login</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>