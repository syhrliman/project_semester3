
<div class="section-header cetak-pdf">

    <?php if (
        $page_title == 'Tambah Tenant'
        or $page_title == 'Sunting Tenant'
        or $page_title == 'Tambah Admin'
        or $page_title == 'Sunting Admin'
        or $page_title == 'Ajukan Sewa'
        or $page_title == 'Rincian Sewa'
        or $page_title == 'Tagihan'
        or $page_title == 'Rincian Data Pelanggan'
        or $page_title == 'Ajukan Perpanjangan Sewa'
        or $page_title == 'Rincian Perpanjangan Sewa'
        or $page_title == 'Tagihan Perpanjangan'
        or $page_title == 'Sunting Profil'
    ) : ?>

        <div class="section-header-back cetak-pdf">
            <a href="#" onclick="back_to_previous()" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
        </div>
    <?php endif; ?>

    <h1 class="cetak-pdf">Sewa Tenant</h1>

    <?php if ($page_title == 'Kelola Tenant' or $page_title == 'Kelola Akun Admin' or $page_title == 'Kelola Metode Pembayaran') : ?>

        <div class="section-header-button">
            <?php if ($page_title == 'Kelola Tenant') : ?>
                <a href="<?php echo base_url('dashboard/tambah-tenant'); ?>" class="btn btn-primary"><i class="fas fa-plus-circle"></i> Tambah</a>
            <?php elseif ($page_title == 'Kelola Akun Admin') : ?>
                <a href="#" class="btn btn-primary" onclick="modal_trigger('tambah-admin')"><i class="fas fa-plus-circle"></i> Tambah</a>
            <?php elseif ($page_title == 'Kelola Metode Pembayaran') : ?>
                <a href="#" class="btn btn-primary" onclick="modal_trigger('tambah-metode-pembayaran')"><i class="fas fa-plus-circle"></i> Tambah</a>
            <?php endif; ?>
        </div>

    <?php endif; ?>


    <?php if ($page_title == 'Kelola Transaksi' and $usertype = $this->session->userdata('usertype') == 'Customer') : ?>
        <?php $url_add_leasing = base_url('dashboard/ajukan-sewa'); ?>

        <div class="section-header-button">
            <a href="<?php echo $url_add_leasing; ?>" class="btn btn-primary"><i class="fas fa-plus-circle"></i> Ajukan Sewa</a>
        </div>
    <?php endif; ?>

    <div class="section-header-breadcrumb">
        <div class="breadcrumb-item active cetak-pdf"><a href="#">Dashboard</a></div>
        <div class="breadcrumb-item cetak-pdf"><?php echo $page_title; ?></div>
    </div>

</div>

<script>
    function back_to_previous() {
        history.go(-1);
    }
</script>