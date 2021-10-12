<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理画面【企業用】</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <link href="<?php echo base_url(); ?>assets/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo base_url(); ?>assets/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="<?php echo base_url(); ?>assets/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <![endif]-->
</head>
<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">
        <a href="#"><b>スタッフPOSアプリ</b><br>管理システム</a>
    </div><!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg" style="font-size: 18px;font-weight: 700;">ログイン</p>
        <div class="row">
            <div class="col-md-12">
                <?php echo validation_errors('<div class="alert alert-danger alert-dismissable">', ' <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button></div>'); ?>
            </div>
        </div>
        <?php
        $error = $this->session->flashdata('error');
        if($error)
        {
            ?>
            <div class="alert alert-danger alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <?php echo $error; ?>
            </div>
        <?php }
        $success = $this->session->flashdata('success');
        if($success)
        {
            ?>
            <div class="alert alert-success alert-dismissable">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <?php echo $success; ?>
            </div>
        <?php } ?>
        <form action="<?php echo base_url(); ?>login" method="post">
            <div class="form-group has-feedback">
                <input type="email" class="form-control" placeholder="メールアドレス" name="email" required />
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" placeholder="パスワード" name="password" required />
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-12 text-right margin-bottom">
                    <a href="<?php echo base_url() ?>forgotPassword">パスワードをお忘れの方 <i class="fa fa-arrow-circle-right"></i></a><br>
                </div>
            </div>

            <div class="row">
                <div class="col-xs-12">
                    <input type="submit" class="btn btn-primary btn-lg btn-block btn-flat" style="border-radius: 5px;" value="ログイン" />
                </div><!-- /.col -->
            </div>
            <div class="row margin">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <input name="remember" type="checkbox"> 次回から自動的にログイン
        <a><img src="https://192.168.111.35/pos_app/api_staff/get_avator?staff_id=2" /></a>
                        </label>
                    </div>
                </div>
            </div>
        </form>


    </div><!-- /.login-box-body -->
</div><!-- /.login-box -->

<script src="<?php echo base_url(); ?>assets/bower_components/jquery/dist/jquery.min.js"></script>
<script src="<?php echo base_url(); ?>assets/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
</body>
</html>