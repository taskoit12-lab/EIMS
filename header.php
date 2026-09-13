<?php
if(!isset($_SESSION['user_id'])) {
    header("Location: " . BASE_URL . "login.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EIMS - Enterprise Inventory Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f2f5;
        }
        .sidebar {
            min-height: 100vh;
            background-color: #2c3e50;
            padding: 0;
        }
        .sidebar-brand {
            padding: 20px;
            background-color: #1a252f;
            color: white;
            text-align: center;
            font-size: 1.2rem;
            font-weight: bold;
        }
        .sidebar .nav-link {
            color: #bdc3c7;
            padding: 12px 20px;
            border-left: 3px solid transparent;
        }
        .sidebar .nav-link:hover {
            color: white;
            background-color: #34495e;
            border-left: 3px solid #3498db;
        }
        .sidebar .nav-link.active {
            color: white;
            background-color: #34495e;
            border-left: 3px solid #3498db;
        }
        .sidebar .nav-link i {
            margin-right: 8px;
        }
        .sidebar-heading {
            color: #7f8c8d;
            font-size: 0.75rem;
            padding: 15px 20px 5px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .main-content {
            padding: 20px;
        }
        .topbar {
            background-color: white;
            padding: 10px 20px;
            border-bottom: 1px solid #dee2e6;
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <div class="col-md-2 sidebar p-0">
            <div class="sidebar-brand">
                📦 EIMS
            </div>
            <nav class="nav flex-column mt-2">
                <p class="sidebar-heading">Main Menu</p>
                <a href="<?php echo BASE_URL; ?>index.php" class="nav-link">
                    <i class="bi bi-speedometer2"></i> Dashboard
                </a>
                
                <p class="sidebar-heading">Inventory</p>
                <a href="<?php echo BASE_URL; ?>modules/products/index.php" class="nav-link">
                    <i class="bi bi-box-seam"></i> Products
                </a>
                <a href="<?php echo BASE_URL; ?>modules/inventory/index.php" class="nav-link">
                    <i class="bi bi-archive"></i> Stock
                </a>
                <a href="<?php echo BASE_URL; ?>modules/warehouses/index.php" class="nav-link"> 
                    <i class="bi bi-building"></i> Warehouses
                </a>
                
                <p class="sidebar-heading">Orders</p>
                <a href="<?php echo BASE_URL; ?>modules/purchase_orders/index.php" class="nav-link">
                    <i class="bi bi-cart-plus"></i> Purchase Orders
                </a>
                <a href="<?php echo BASE_URL; ?>modules/sales_orders/index.php" class="nav-link">
                    <i class="bi bi-cart-dash"></i> Sales Orders
                </a>
                <a href="<?php echo BASE_URL; ?>modules/sales_orders/quick_bill.php" class="nav-link"> <i class="bi bi-upc-scan"></i> Quick Billing </a>
                
                <p class="sidebar-heading">Management</p>
                <a href="<?php echo BASE_URL; ?>modules/suppliers/index.php" class="nav-link">
                    <i class="bi bi-truck"></i> Suppliers
                </a>
                <a href="<?php echo BASE_URL; ?>modules/returns/index.php" class="nav-link">
                    <i class="bi bi-arrow-return-left"></i> Returns
                </a>
                
                <p class="sidebar-heading">Reports</p>
                <a href="<?php echo BASE_URL; ?>modules/reports/index.php" class="nav-link">
                    <i class="bi bi-file-earmark-bar-graph"></i> Reports
                </a>
                
                <?php if($_SESSION['role'] == 'ADMIN'): ?>
                <p class="sidebar-heading">Admin</p>
                <a href="<?php echo BASE_URL; ?>modules/admin/users.php" class="nav-link">
                    <i class="bi bi-people"></i> Users
                </a>
                <a href="<?php echo BASE_URL; ?>modules/admin/audit.php" class="nav-link">
                    <i class="bi bi-journal-text"></i> Audit Log
                </a>
                <a href="<?php echo BASE_URL; ?>modules/admin/settings.php" class="nav-link">
                    <i class="bi bi-gear"></i> Settings
                </a>
                <?php endif; ?>
            </nav>
        </div>

        <!-- Main Content -->
        <div class="col-md-10 main-content">
            <!-- Topbar -->
            <div class="topbar d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Welcome, <?php echo $_SESSION['full_name']; ?>!</h5>
                <div>
                    <span class="badge bg-dark me-2">
                        <?php echo $_SESSION['role']; ?>
                    </span>
                    <a href="<?php echo BASE_URL; ?>logout.php" class="btn btn-sm btn-outline-danger">
                        <i class="bi bi-box-arrow-right"></i> Logout
                    </a>
                </div>
            </div>