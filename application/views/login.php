<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="<?php echo base_url(); ?>assets/images/favicon.png" type="image/png">
    <title>POSアプリ管理</title>
    <link href="<?php echo base_url(); ?>assets/css/icons.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>assets/css/style.css" rel="stylesheet">
    <link href="<?php echo base_url(); ?>assets/css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <![endif]-->
</head>
<body class="sticky-header">

<!--Start login Section-->
<section class="login-section">
    <div class="container">
        <div class="row">
            <div class="login-wrapper">
                <div class="login-inner">

                    <div class="logo">
                        VISIT-POS.NET
                    </div>

                    <h2 class="header-title text-center">Login</h2>

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
                        <div class="form-group">
                            <input type="text"  type="email" class="form-control" placeholder="メールアドレス" name="email" required >
                        </div>

                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="パスワード" name="password" required />
                        </div>

                        <div class="form-group">
                            <div class="pull-left">
                                <div class="checkbox primary">
                                    <input name="remember" id="checkbox-2" type="checkbox">
                                    <label for="checkbox-2">Remember me</label>
                                </div>
                            </div>

                            <div class="pull-right">
                                <a href="<?php echo base_url() ?>forgotPassword" class="a-link">
                                    <i class="fa fa-unlock-alt"></i> Forgot password?
                                </a>
                            </div>
                        </div>

                        <div class="form-group">
                            <input type="submit" class="btn btn-primary btn-block" value="ログイン" />
                        </div>

                        <div class="form-group text-center">
                            Don't have an account?  <a href="registration.html">Sign Up </a>
                        </div>


                    <div class="copy-text">
                        <p class="m-0">2022 &copy; Devotion Co., Ltd.</p>
                    </div>

                </div>
            </div>

        </div>
    </div>
</section>

<script src="<?php echo base_url(); ?>assets/js/jquery.min.js"></script>
<script src="<?php echo base_url(); ?>assets/js/bootstrap.min.js"></script>
</body>
</html>
