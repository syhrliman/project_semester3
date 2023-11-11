<?php $usertype = $this->session->userdata('usertype'); ?>

<?php if ($usertype != 'Collection') : ?>
    <div class="card">
        <div class="card-header">
            <h4><?php echo $content_title; ?></h4>
        </div>

        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-striped table-md">
                    <tr>
                        <th class="text-center">#</th>
                        <th class="text-center">No. Transaksi</th>
                        <th class="text-center">Tenant</th>
                        <th class="text-center">Periode Sewa</th>
                        <!-- <th class="text-center">Status Sewa</th>
                        <?php if ($usertype == 'Customer') : ?>
                            <th class="text-center">Template Kontrak</th>
                        <?php endif; ?>
                        <?php if ($usertype == 'Administrator' or $usertype == 'Leasing') : ?>
                            <th class="text-center">Dokumen Kontrak</th>
                        <?php endif; ?> -->
                        <?php if ($usertype == 'Administrator' or $usertype == 'Billing') : ?>
                            <th class="text-center">Bukti Pembayaran</th>
                        <?php endif; ?>
                        <th class="text-center">Aksi</th>
                    </tr>

                    <?php if (empty($get_trx_list)) : ?>
                        <tr>
                            <td colspan="6" class="text-center">Data tidak tersedia.</td>
                        </tr>
                    <?php endif; ?>

                    <?php $no = 1;
                    foreach ($get_trx_list as $transaction_list) : ?>
                        <tr>
                            <td class="text-center"><?php echo $no; ?></td>
                            <td class="text-center">
                                <a href="<?php echo base_url('dashboard/tagihan/' . $transaction_list->transaction_no); ?>" data-toggle="tooltip" data-placement="right" title="" data-original-title="Lihat Tagihan">
                                    <?php echo $transaction_list->transaction_no; ?>
                                </a>
                            </td>
                            <td><?php echo $transaction_list->tenant_name; ?></td>
                            <td class="text-center">
                                <?php echo date('d/m/Y', strtotime($transaction_list->transaction_rent_from)) . ' - ' . date('d/m/Y', strtotime($transaction_list->transaction_rent_to)); ?>
                            </td>
                            <?php if ($usertype == 'Administrator' or $usertype == 'Billing') : ?>
                                <td class="text-center">
                                    <?php if (!empty($transaction_list->payment_paymentslip_file)) : ?>
                                        <a href="#" onclick="modal_trigger('bukti-pembayaran')">Lihat</a>
                                    <?php else : ?>
                                        -
                                    <?php endif; ?>
                                </td>
                            <?php endif; ?>
                            <td class="text-center">
                                <a href="<?php echo base_url('dashboard/rincian-sewa/' . $transaction_list->transaction_no); ?>" class="btn btn-primary">Detail</a>
                        </tr>
                    <?php $no++;
                    endforeach; ?>
                </table>
            </div>
        </div>

        <div class="card-footer bg-whitesmoke">
            &nbsp;
        </div>
    </div>
<?php endif; ?>

<!-- Modal Payment Slip -->
<?php foreach ($get_trx_list as $transaction_list) : ?>
    <div class="modal-backdrop" id="bukti-pembayaran" onclick="windowOnClick(this)">
        <div class="modal-content modal-form-content">
            <div class="modal-header modal-form-header">
                <h5 class="modal-title">Bukti Pembayaran</h5>
                <span class="close-modal" onclick="modal_trigger('bukti-pembayaran')">
                    <svg xmlns='http://www.w3.org/2000/svg' class='ionicon' viewBox='0 0 512 512'>
                        <path fill='none' stroke='currentColor' stroke-linecap='round' stroke-linejoin='round' stroke-width='32' d='M368 368L144 144M368 144L144 368' />
                    </svg>
                </span>
            </div>

            <?php echo form_open_multipart('dashboard/verifikasi-pembayaran'); ?>
            <div class="modal-body modal-form-body">
                <input type="hidden" name="transaction_no" value="<?php echo $transaction_list->transaction_no; ?>" />

                <div class="text-center">
                    <img src="<?php echo base_url('assets/uploads/payment-slip/' . $transaction_list->payment_paymentslip_file); ?>" style="width: 250px; margin: auto; display: block;" alt="Bukti Pembayaran">
                    <?php if ($transaction_list->verifyps_status_code == 3) : ?>
                        <span class="badge badge-success activestatus-label mt-3"><?php echo $transaction_list->verifyps_status_name ?></span>
                    <?php endif; ?>
                </div>
            </div>

            <div class="modal-footer bg-whitesmoke br">
                <button type="button" class="btn btn-secondary" onclick="modal_trigger('bukti-pembayaran')">Batal</button>
                <?php if ($transaction_list->verifyps_status_code != 3) : ?>
                    <button type="submit" class="btn btn-primary">Verifikasi</button>
                <?php endif; ?>
            </div>
            <?php echo form_close(); ?>
        </div>
    </div>
<?php $no++;
endforeach; ?>

<!-- Renewal - Modal Payment Slip -->
<?php foreach ($get_ret_list as $renewal_list) : ?>
    <div class="modal-backdrop" id="bukti-pembayaran-perpanjangan" onclick="windowOnClick(this)">
        <div class="modal-content modal-form-content">
            <div class="modal-header modal-form-header">
                <h5 class="modal-title">Bukti Pembayaran</h5>
                <span class="close-modal" onclick="modal_trigger('bukti-pembayaran-perpanjangan')">
                    <svg xmlns='http://www.w3.org/2000/svg' class='ionicon' viewBox='0 0 512 512'>
                        <path fill='none' stroke='currentColor' stroke-linecap='round' stroke-linejoin='round' stroke-width='32' d='M368 368L144 144M368 144L144 368' />
                    </svg>
                </span>
            </div>

            <?php echo form_open_multipart('dashboard/verifikasi-pembayaran'); ?>
            <div class="modal-body modal-form-body">
                <input type="hidden" name="transaction_no" value="<?php echo $renewal_list->renewal_no; ?>" />
                <input type="hidden" name="transaction_type" value="renewal" />

                <div class="text-center">
                    <img src="<?php echo base_url('assets/uploads/payment-slip/' . $renewal_list->payment_paymentslip_file); ?>" style="width: 250px; margin: auto; display: block;" alt="Bukti Pembayaran">
                    <?php if ($renewal_list->verifyps_status_code == 3) : ?>
                        <span class="badge badge-success activestatus-label mt-3"><?php echo $renewal_list->verifyps_status_name ?></span>
                    <?php endif; ?>
                </div>
            </div>

            <div class="modal-footer bg-whitesmoke br">
                <button type="button" class="btn btn-secondary" onclick="modal_trigger('bukti-pembayaran-perpanjangan')">Batal</button>
                <?php if ($renewal_list->verifyps_status_code != 3) : ?>
                    <button type="submit" class="btn btn-primary">Verifikasi</button>
                <?php endif; ?>
            </div>
            <?php echo form_close(); ?>
        </div>
    </div>
<?php $no++;
endforeach; ?>