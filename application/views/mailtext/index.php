<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <i class="fa fa-building"></i> メール本文管理
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
                            <table class="form_edit">
                                <tr>
                                    <th>タイプ</th>
                                    <td>
                                        <select class="form-control" name="cond[mail_type]" onchange="form.submit();">
                                            <?php foreach ($notices as $key => $txt){ ?>
                                            <option <?php if ($key==$cond['mail_type']) echo 'selected'; ?> value="<?php echo $key; ?>"><?php echo $txt; ?></option>
                                            <?php } ?>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>タイトル
                                    <td>
                                        <input class="form-control" type="text" name="data[title]" value="<?php echo empty($result['title']) ? '' : $result['title']; ?>" required/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>内容
                                    <td>
                                        <textarea name="data[content]" class="form-control" style="resize: vertical;min-height: 350px;"><?php echo empty($result['content']) ? '' : $result['content']; ?></textarea>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div style="padding:20px; text-align: center;">
                            <input  class="btn btn-primary" type="button" value="保存する" onclick="$('#mode').val('save'); form.submit();"/>
                        </div>
                        <input type="hidden" name="mode" id="mode" />
                    </div><!-- /.box -->
                </div>
            </div>
        </form>

    </section>
</div>
