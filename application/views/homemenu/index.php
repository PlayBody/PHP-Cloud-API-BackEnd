<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <i class="fa fa-building"></i> メニュー管理
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
        <form id="form1" name="form1" method="post">
            <div>
                <div class="col-xs-12">
                    <div class="box row" style="padding: 20px; display: flex;align-items: center;">
                        <div class="col-lg-2">企業名　：</div>
                        <div class="col-lg-11">
                            <select name="cond[company_id]" class="form-control" onchange="form.submit();">
                                <?php foreach($companies as $item){ ?>
                                    <option value="<?php echo $item['company_id']; ?>" <?php if ($cond['company_id']== $item['company_id']) echo 'selected'; ?> >
                                        <?php echo $item['company_name']; ?>
                                    </option>
                                <?php } ?>
                            </select>
                        </div>
                    </div><!-- /.box -->
                </div>
            </div>

            <style>
                .form_edit{
                    width: 100%;
                }
                .form_edit tr{
                    border-bottom: solid #cccccc 1px;
                }
                .form_edit tr:first-child{
                    border-top: solid #cccccc 1px;
                }
                .form_edit th{
                    text-align: center;
                    background-color: #efefef;
                    width: 20%;
                }
                .form_edit td{
                    padding: 8px;
                }
            </style>
            <div>
                <div class="col-xs-12">
                    <div class="box row" >
                        <div>

                            <table class="table table-hover">
                                <tr>
                                    <th>No</th>
                                    <th>タイトル</th>
                                    <th width="130">使用可能</th>
                                    <th>順序</th>
                                    <th width="60"></th>
                                    <th width="60"></th>
                                </tr>
                                <?php
                                $i=1;
                                if(!empty($menus))
                                {
                                    foreach($menus as $record)
                                    {
                                        ?>
                                        <tr>
                                            <td><?php echo $i++; ?></td>
                                            <td><?php echo $record['menu_name']; ?></td>
                                            <td>
                                                <select class="form-control" onchange="
                                                    $('#menu_id').val(<?php echo $record['id']; ?>);
                                                    $('#is_use').val(this.value);
                                                    $('#mode').val('save');
                                                    form.submit();
                                                    ">
                                                    <option value="1" <?php if($record['is_use']==1){ echo 'selected';} ?>>ON</option>
                                                    <option value="0" <?php if($record['is_use']==0){ echo 'selected';} ?>>OFF</option>
                                                </select>
                                            </td>
                                            <td><?php echo $record['sort']; ?></td>
                                            <td>
                                                <button class="btn" onclick="
                                                    $('#mode').val('up');
                                                    $('#menu_id').val(<?php echo $record['id']; ?>);
                                                    form.submit();
                                                "><i class="fa fa-arrow-up"></i> </button>
                                            </td>
                                            <td>
                                                <button class="btn" onclick="
                                                    $('#mode').val('down');
                                                    $('#menu_id').val(<?php echo $record['id']; ?>);
                                                    form.submit();
                                                    "><i class="fa fa-arrow-down"></i> </button>
                                            </td>
                                        </tr>
                                        <?php
                                    }
                                }
                                ?>
                            </table>
                        </div>
                        <input type="hidden" name="mode" id="mode" />
                        <input type="hidden" name="menu_id" id="menu_id" />
                        <input type="hidden" name="is_use" id="is_use" />
                    </div><!-- /.box -->
                </div>
            </div>
        </form>

    </section>
</div>
