<?php
    // Get usertype session
    $usertype = $this->session->userdata('usertype');
?>
<div class="row">
    <?php if($usertype == "Administrator"): ?>
        <div class="col-lg-3 col-md-6 col-sm-6 col-12">
            <div class="card card-statistic-1">
                <div class="card-icon bg-primary">
                    <i class="far fa-user"></i>
                </div>
                <div class="card-wrap">
                    <div class="card-header">
                        <h4>Total Admin</h4>
                    </div>
                    <div class="card-body">
                        <?php echo $total_admins; ?>
                    </div>
                </div>
            </div>
        </div>
    <?php endif; ?>
    <div class="col-lg-3 col-md-6 col-sm-6 col-12">
        <div class="card card-statistic-1">
            <div class="card-icon bg-danger">
                <i class="far fa-newspaper"></i>
            </div>
            <div class="card-wrap">
                <div class="card-header">
                    <h4>Tenant</h4>
                </div>
                <div class="card-body">
                    <?php echo $total_tenants; ?>
                </div>
            </div>
        </div>
    </div>
    <div class="col-lg-3 col-md-6 col-sm-6 col-12">
        <div class="card card-statistic-1">
            <div class="card-icon bg-success">
                <i class="fas fa-circle"></i>
            </div>
            <div class="card-wrap">
                <div class="card-header">
                    <h4>Total Pelanggan</h4>
                </div>
                <div class="card-body">
                    <?php echo $total_customers; ?>
                </div>
            </div>
        </div>
    </div>                  
</div>