<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <i class="fa fa-user"></i> ユーザー管理
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
                                    <th>ユーザー名
                                    <td>
                                        <div class="input-group" style="display: flex;">
                                            <div style="width: 160px; margin-right: 20px;">
                                                <input class="form-control" type="text" name="user[user_first_name]" value="<?php echo $user['user_first_name']; ?>" required/>
                                            </div>
                                            <div style="width: 160px;">
                                                <input class="form-control" type="text" name="user[user_last_name]" value="<?php echo $user['user_last_name']; ?>" required/>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>ニックネーム</th>
                                    <td>
                                        <input class="form-control" type="text" name="user[user_nick]" value="<?php echo $user['user_nick']; ?>" required/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>メールアドレス</th>
                                    <td>
                                        <input class="form-control" type="text" name="user[user_email]" value="<?php echo $user['user_email']; ?>" required/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>電話番号
                                    <td>
                                        <input class="form-control" type="text" name="user[user_tel]" value="<?php echo $user['user_tel']; ?>" required/>
                                    </td>
                                </tr>
                                <tr>
                                    <th>性別
                                    <td>
                                        <select name="user[user_sex]" class="form-control" style="width: 120px;">
                                            <option <?php if ($user['user_sex']==1) echo 'selected'; ?> value="1">男</option>
                                            <option <?php if ($user['user_sex']==2) echo 'selected'; ?> value="2">女</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>パスウード
                                    <td>
                                        <input class="form-control" type="password" name="user[user_password]" value=""/>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div style="padding:20px; text-align: center;">
                            <input  class="btn btn-primary" type="submit" value="保存する" />
                            <input  class="btn btn-danger" type="button" value="このユーザーを削除" onclick="
                                if (confirm('Is Delete')){
                                    $('#mode').val('delete'); form.submit();
                                }

                            "/>
                            <input  class="btn btn-default" type="button" value="戻る" onclick="location.href='<?php echo base_url(); ?>/user/index'"/>
                        </div>
                    </div><!-- /.box -->
                </div>
            </div>
            <input type="hidden" name="mode" id="mode" />
        </form>

    </section>
</div>
