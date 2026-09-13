<?php
session_start();
require_once 'config/database.php';
require_once 'includes/header.php';

$conn = getConnection();

// Total Products count
$products_result = mysqli_query($conn, "SELECT COUNT(*) as total FROM products WHERE status='ACTIVE'");
$products_row = mysqli_fetch_assoc($products_result);
$total_products = $products_row['total'];

// Total Suppliers count
$suppliers_result = mysqli_query($conn, "SELECT COUNT(*) as total FROM suppliers");
$suppliers_row = mysqli_fetch_assoc($suppliers_result);
$total_suppliers = $suppliers_row['total'];

// Pending Purchase Orders
$po_result = mysqli_query($conn, "SELECT COUNT(*) as total FROM purchase_orders WHERE status IN ('DRAFT','SENT','CONFIRMED','PARTIALLY_RECEIVED')");
$po_row = mysqli_fetch_assoc($po_result);
$pending_po = $po_row['total'];

// Pending Sales Orders
$so_result = mysqli_query($conn, "SELECT COUNT(*) as total FROM sales_orders WHERE status IN ('DRAFT','CONFIRMED','PICKING')");
$so_row = mysqli_fetch_assoc($so_result);
$pending_so = $so_row['total'];

// Low Stock Alerts
$alerts_result = mysqli_query($conn, "SELECT COUNT(*) as total FROM reorder_alerts WHERE alert_status='ACTIVE'");
$alerts_row = mysqli_fetch_assoc($alerts_result);
$total_alerts = $alerts_row['total'];

// Recent Stock Movements
$movements_result = mysqli_query($conn, "SELECT m.*, p.name as product_name, u.full_name as user_name FROM movement_records m JOIN products p ON m.product_id = p.product_id JOIN users u ON m.performed_by = u.user_id ORDER BY m.occurred_at DESC LIMIT 5");

mysqli_close($conn);
?>

<!-- Dashboard Cards -->
<div class="row mb-4">
    <div class="col-md-3">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <p class="text-muted mb-1">Total Products</p>
                        <h3 class="mb-0"><?php echo $total_products; ?></h3>
                    </div>
                    <div class="bg-primary bg-opacity-10 p-3 rounded">
                        <i class="bi bi-box-seam text-primary fs-4"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="col-md-3">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <p class="text-muted mb-1">Total Suppliers</p>
                        <h3 class="mb-0"><?php echo $total_suppliers; ?></h3>
                    </div>
                    <div class="bg-success bg-opacity-10 p-3 rounded">
                        <i class="bi bi-truck text-success fs-4"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="col-md-3">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <p class="text-muted mb-1">Pending Orders</p>
                        <h3 class="mb-0"><?php echo $pending_po + $pending_so; ?></h3>
                    </div>
                    <div class="bg-warning bg-opacity-10 p-3 rounded">
                        <i class="bi bi-cart text-warning fs-4"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="col-md-3">
        <div class="card border-0 shadow-sm">
            <div class="card-body">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <p class="text-muted mb-1">Low Stock Alerts</p>
                        <h3 class="mb-0 <?php echo $total_alerts > 0 ? 'text-danger' : ''; ?>">
                            <?php echo $total_alerts; ?>
                        </h3>
                    </div>
                    <div class="bg-danger bg-opacity-10 p-3 rounded">
                        <i class="bi bi-exclamation-triangle text-danger fs-4"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Recent Movements -->
<div class="row">
    <div class="col-md-12">
        <div class="card border-0 shadow-sm">
            <div class="card-header bg-white">
                <h6 class="mb-0">
                    <i class="bi bi-clock-history"></i> 
                    Recent Stock Movements
                </h6>
            </div>
            <div class="card-body">
                <table class="table table-hover">
                    <thead class="table-light">
                        <tr>
                            <th>Product</th>
                            <th>Type</th>
                            <th>Quantity</th>
                            <th>Before</th>
                            <th>After</th>
                            <th>Done By</th>
                            <th>Time</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if(mysqli_num_rows($movements_result) > 0): ?>
                            <?php while($row = mysqli_fetch_assoc($movements_result)): ?>
                            <tr>
                                <td><?php echo $row['product_name']; ?></td>
                                <td>
                                    <?php
                                    $badges = [
                                        'RECEIPT' => 'success',
                                        'ISSUE' => 'danger',
                                        'TRANSFER' => 'info',
                                        'ADJUSTMENT' => 'warning',
                                        'RESTOCK' => 'primary'
                                    ];
                                    $badge = $badges[$row['movement_type']] ?? 'secondary';
                                    ?>
                                    <span class="badge bg-<?php echo $badge; ?>">
                                        <?php echo $row['movement_type']; ?>
                                    </span>
                                </td>
                                <td><?php echo $row['quantity']; ?></td>
                                <td><?php echo $row['qty_before']; ?></td>
                                <td><?php echo $row['qty_after']; ?></td>
                                <td><?php echo $row['user_name']; ?></td>
                                <td><?php echo date('d M Y H:i', strtotime($row['occurred_at'])); ?></td>
                            </tr>
                            <?php endwhile; ?>
                        <?php else: ?>
                            <tr>
                                <td colspan="7" class="text-center text-muted">
                                    Abhi koi stock movement nahi hua
                                </td>
                            </tr>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<?php require_once 'includes/footer.php'; ?>