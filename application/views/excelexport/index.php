<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-file-excel-o"></i> Excelエスポート
        <small></small>
      </h1>
    </section>

    <section class="content">
        <div class="row">
            <div class="col-xs-12 text-right">
                <div class="form-group">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <?php
                $this->load->helper('form');
                $error = $this->session->flashdata('error');
                if ($error) {
                    ?>
                    <div class="alert alert-danger alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <?php echo $this->session->flashdata('error'); ?>
                    </div>
                <?php } ?>
                <?php
                $success = $this->session->flashdata('success');
                if ($success) {
                    ?>
                    <div class="alert alert-success alert-dismissable">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <?php echo $this->session->flashdata('success'); ?>
                    </div>
                <?php } ?>

                <div class="row">
                    <div class="col-md-12">
                        <?php echo validation_errors('<div class="alert alert-danger alert-dismissable">', ' <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button></div>'); ?>
                    </div>
                </div>
            </div>
        </div>
        <style>
            .excel_export_list {
                padding-bottom: 12px;
            }
            .excel_export_list li{
                margin-top: 12px;
                /*list-style: none;*/
            }
            .excel_export_list li a{
                list-style: none;
            }
        </style>
        <div class="row" style="margin-left: 0; margin-left:-10px; margin-right:-10px;">
            <div class="col-xs-12">
                <div class="box">
                    <ul class="excel_export_list">
                        <li><a href="<?php echo base_url(); ?>excelexport/export1">金山店予算</a></li>
                        <li><a href="<?php echo base_url(); ?>excelexport/export2">手温イオンモール木曽川店予算</a></li>

                    </ul>
                </div><!-- /.box -->
            </div>
        </div>

    </section>
</div>
