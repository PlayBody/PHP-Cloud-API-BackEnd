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
        <div class="row" style="margin-left: 0; margin-left:-10px; margin-right:-10px;">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <div class="row mb-3">
                            <label for="start_date" class="col-xs-2 col-form-label">店舗選択：</label>
                            <div class="col-xs-6">

                                <select class="form-control">
                                    <option value="">▼選択してください。</option>
                                    <?php foreach ($organ_list as $organ){ ?>
                                        <option <?php if ($organ_id==$organ['organ_id']) echo 'selected'; ?> value="<?php echo $organ['organ_id']; ?>"><?php echo $organ['organ_name']; ?></option>
                                    <?php } ?>
                                </select>

                            </div>
                        </div>
                    </div><!-- /.box-header -->
                    <div class="box-footer clearfix" style="padding: 0px;">

                        <label for="start_date" class="col-xs-2 col-form-label">日付設定：</label>
                        <div class="col-xs-2">

                            <select class="form-control">
                                <option>年を選択</option>
                                <?php for($i=($date_year-5);$i<=($date_year+5);$i++){ ?>
                                    <option <?php if ($date_year==$i) echo 'selected'; ?> value="<?php echo $i ; ?>"><?php echo $i.'年'; ?></option>
                                <?php } ?>
                            </select>

                        </div>
                        <div class="col-xs-1">

                            <select class="form-control">
                                <option>月を選択</option>
                                <?php for($i=1;$i<=12;$i++){ ?>
                                    <option <?php if ($date_month==($i<10 ? '0'.$i : $i)) echo 'selected'; ?> value="<?php echo $i<10 ? '0'.$i : $i ; ?>"><?php echo $i.'月'; ?></option>
                                <?php } ?>

                            </select>

                        </div>
                    </div>
                    <div class="box-body" style="margin-left: 20px;">


                    </div>
                    <div class="box-footer clearfix">
                        <button class="btn btn-primary">export</button>
<!--                        --><?php //echo $this->pagination->create_links(); ?>
                    </div>
                </div><!-- /.box -->
            </div>
        </div>

    </section>
</div>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/staff.js" charset="utf-8"></script>
