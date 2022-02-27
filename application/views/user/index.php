<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <i class="fa fa-users"></i> ユーザー管理
        <small></small>
      </h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-md-12">
                <?php
                    $this->load->helper('form');
                    $error = $this->session->flashdata('error');
                    if($error)
                    {
                ?>
                <div class="alert alert-danger alert-dismissable">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    <?php echo $this->session->flashdata('error'); ?>                    
                </div>
                <?php } ?>
                <?php  
                    $success = $this->session->flashdata('success');
                    if($success)
                    {
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
        <form method="POST" id="searchList" method="post" action="<?php echo base_url(); ?>user/index">
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
        <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                    <h3 class="box-title">ユーザー一覧</h3>
                    <div class="box-tools">
                            <div class="input-group">
                              <input type="text" name="cond[search]" value="<?php echo $cond['search']; ?>" class="form-control input-sm pull-right" style="width: 150px;" placeholder="Search"/>
                              <div class="input-group-btn">
                                <button type="submit" class="btn btn-sm btn-default searchList"><i class="fa fa-search"></i></button>
                              </div>
                            </div>
                    </div>
                </div><!-- /.box-header -->
                <div class="box-body table-responsive no-padding">
                  <table class="table table-hover">
                    <tr>
                        <th>No</th>
                        <th>ユーザーNo</th>
                        <th>ユーザー名</th>
                        <th>ニックネーム</th>
                        <th>メール</th>
                        <th>電話番号</th>
                        <th>性別</th>
                        <th>生年月日</th>
                        <th>登録日</th>
                    </tr>
                    <?php
                    $i=1;
                    if(!empty($users))
                    {
                        foreach($users as $record)
                        {
                    ?>
                    <tr>
                        <td><?php echo $i++; ?></td>
                        <td><?php echo $record['user_no']; ?></td>
                        <td><?php echo $record['user_first_name']. ' ' .$record['user_last_name']; ?></td>
                        <td><?php echo $record['user_nick']; ?></td>
                        <td><a href="<?php echo base_url(); ?>/user/edit?user_id=<?php echo $record['user_id']; ?>"><?php echo $record['user_email']; ?></td>
                        <td><?php echo $record['user_tel']; ?></td>
                        <td><?php echo $record['user_sex']==1 ? '男' : '女'; ?></td>
                        <td><?php echo $record['user_birthday']; ?></td>
                        <td><?php echo $record['create_date']; ?></td>
                    </tr>
                    <?php
                        }
                    }
                    ?>
                  </table>
                  
                </div><!-- /.box-body -->
                  <style>
                      .pagenavi-bar{
                          margin-right: 40px;
                          text-align: right;
                      }
                      .pagenavi-bar a, .pagenavi-bar strong{
                          padding: 0 8px;
                      }


                  </style>
                <div class="box-footer clearfix pagenavi-bar">
                    <?php echo $links; ?>
                </div>
              </div><!-- /.box -->
            </div>
        </div>
        </form>
    </section>
</div>
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/common.js" charset="utf-8"></script>
<script type="text/javascript">
    jQuery(document).ready(function(){
        jQuery('ul.pagination li a').click(function (e) {
            e.preventDefault();            
            var link = jQuery(this).get(0).href;            
            var value = link.substring(link.lastIndexOf('/') + 1);
            jQuery("#searchList").attr("action", baseURL + "userList/" + value);
            jQuery("#searchList").submit();
        });
    });
</script>
