<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

<div class="page-title-box">
    <form method="post">
        <div class="row">
            <div class="button-wrap col-md-2">
                <button type="button" class="btn btn-default outline-btn"> < </button>
                <button type="button" class="btn btn-default outline-btn"> 今日 </button>
                <button type="button" class="btn btn-default outline-btn"> > </button>
            </div>
            <div class="col-md-2">
                <div class="input-group">
                    <input type="text" name="select_date" class="form-control" data-date-format="yyyy-mm-dd" placeholder="yyyy-mm-dd" id="receipt_date" value="<?php echo $select_date; ?>" onchange="form.submit();">
                    <span class="input-group-addon b-0 text-white"><i class="icon-calender"></i></span>

                </div>
            </div>
            <div class="button-wrap col-md-2">
                <button type="submit" class="btn btn-warning"><i class="icon-refresh"></i></button>
            </div>
            <div class="button-wrap" style="float: right; display: flex;">
                <select class="form-control m-b-15" name="organ_id" onchange="form.submit()">
                    <?php foreach ($organs as $organ){ ?>
                    <option <?php if($organ['organ_id']==$organ_id){ echo 'selected'; }?> value="<?php echo $organ['organ_id']; ?>"><?php echo $organ['organ_name']; ?></option>
                    <?php } ?>
                </select>
            </div>
        </div>
        <input type="hidden" name = 'mod' id="mod" value="<?php echo $mod; ?>" />
    </form>
</div>
<div class="epark_content" style="display: flex;">
    <div style="width: 45px; background-color: #ebe9e9;">
        <ul class="left_nav">
            <li class="nav_item"><div>予約</div><i class="fa fa-clock-o fa-2x"></i></li>
            <li nav_id="left_close" class="nav_item"><div>閉じる</div><i class="fa fa-arrow-left fa-2x"></i></li>
            <li class="nav_item"><div>予約</div><i class="fa fa-reply fa-2x"></i></li>
            <li class="nav_item"><div>予約</div><i class="fa  fa-shopping-cart fa-2x"></i></li>
            <li nav_id="left_user" class="nav_item"><div>顧客</div><i class="fa fa-user fa-2x"></i></li>
            <li class="nav_item"><div>予約</div><i class="fa fa-credit-card fa-2x"></i></li>
            <li class="nav_item"><div>予約</div><i class="fa fa-warning fa-2x"></i></li>
        </ul>
    </div>
    <div id="receipt_left_panel" style="width: 350px; background-color: #dbac8b; padding: 8px 10px; display: none;" >
        <input type="text" class="form-control" />
        <div style="height: 24px;"></div>
        <div style="background-color: white; padding:12px;">
            <button type="button" class="btn btn-danger">Danger</button>
            <button><i class="icon-close"></i></button>
            <div>性別:</div>
            <div><i class="fa fa-male"></i>男性<input type="checkbox" /><i class="fa fa-female"></i>女性<input type="checkbox" /></div>
            <div>名前:</div>
            <div><input type="text" /></div>
            <div>NICK:</div>
            <div><input type="text" /></div>
            <div>電話番号:</div>
            <div><input type="text" /></div>
        </div>
    </div>
    <div class="content" style="    flex: 1 0 0%;">
        <div class="full_button_group m-b-10">
            <?php for($i=$available_time_from; $i<=$available_time_to; $i++){ ?>
                <div>
                    <span>2</span>
                    <button type="button" ><?php echo $i; ?></button>
                </div>
            <?php } ?>
        </div>

        <div class="m-b-10" style="display: flex;">
            <div class="btn-group" style="display: contents;">
                <button type="button" class="btn btn-white">基本</button>
                <button type="button" class="btn btn-warning">全体</button>
            </div>
            <div style="width: 12px;"></div>
            <div class="btn-group" style="display: contents;">
                <button type="button" class="btn <?php echo $mod=='shift' ? 'btn-warning' : 'btn-white'; ?>" onclick="change_view_mod('shift')">シフト</button>
                <button type="button" class="btn <?php echo $mod=='table' ? 'btn-warning' : 'btn-white'; ?>" onclick="change_view_mod('table')">ブース</button>
                <button type="button" class="btn <?php echo $mod=='both' ? 'btn-warning' : 'btn-white'; ?>" onclick="change_view_mod('both')">両方</button>
            </div>
            <div style="width: 12px;"></div>
            <div class="" style="margin 0 12px; border:1px dashed #9e9e9e;background-color: white;padding: 6px 12px; width: 100%; text-align: center;">
                日付をまたいで予定を変更したい場合は、一旦このエリアに置いてください。
            </div>
            <div style="width: 12px;"></div>
            <button type="button" class="btn btn-white">シフト追加</button>
        </div>

        <div class="epark_content_view" style="background-color: #9e9e9e;" >
            <div class="epark_content_row" style="display: flex; padding:4px 0;">
                <div style="width: 180px;"></div>
                <div style="width: 100%; display: flex;">

                    <?php for($i=$available_time_from; $i<=$available_time_to; $i++){ ?>
                        <div style="width: 10%;">
                            <div style="background-color: #5e5e5e;color:white; border-radius: 20px;display: inline-block; width: 28px; height: 28px;line-height:28px;text-align: center;">
                                <?php echo $i; ?>
                            </div>
                        </div>
                    <?php } ?>
                </div>
            </div>
            <?php if($mod=='both'){ ?>
                <div class="shift_item_title">シフト</div>
            <?php } ?>

            <?php if($mod!='table'){ ?>
            <?php foreach ($staffs as $staff_id => $staff){ ?>
                <div class="epark_content_row" style="display: flex;">

                    <div class="staff_drag_item <?php echo $staff['sex']==1 ? 'staff_sex_1' : 'staff_sex_2'; ?>">
                        <div style="width: 100%;"><?php echo $staff['name']; ?></div>
                        <i class="icon-lock"></i>
                    </div>

                    <div style="width: 100%; display: flex;position:relative; background-color: #b5b5b5;">
                        <?php if (!empty($staff['shifts']))
                            foreach ($staff['shifts'] as $shift) { ?>
                            <div class="<?php
                            if($shift['shift_type']==1){ echo 'shift-submit'; }
                            if($shift['shift_type']==2){ echo 'shift-apply'; }
                            if($shift['shift_type']==-2){ echo 'shift-reject'; }
                            if($shift['shift_type']==-3){ echo 'shift-out'; }
                            if($shift['shift_type']==3){ echo 'shift-reply'; }
                            if($shift['shift_type']==4){ echo 'shift-request'; }
                            if($shift['shift_type']==6){ echo 'shift-rest'; }
                                ?>" style="left: <?php echo $one_minute_length * ($shift['start']-$available_time_from*60); ?>%;  width: <?php echo $one_minute_length * $shift['width']; ?>%; height: 50px; display: flex; position: absolute;">
                                <?php for($t = $shift['start']; $t<$shift['start'] + $shift['width']; $t+=5){ ?>
                                    <div style="width: <?php echo 5/$shift['width']*100; ?>%;" class="time_element <?php if ($t%60==0){ ?>time_border_left_2<?php  }elseif ($t%10==0){  ?>time_border_left<?php } ?>" title="<?php echo intval($t/60).':'.$t%60; ?>"></div>
                                <?php } ?>
                            </div>
                        <?php } ?>
                        <?php if (!empty($staff['reserves']))
                            foreach ($staff['reserves'] as $reserve) { ?>
                            <div class="<?php
                                if($reserve['is_before']){
                                    echo 'reserve-before';
                                }else{
                                    if($reserve['reserve_status']==1){
                                        echo 'reserve-request';
                                    }elseif($reserve['reserve_status']==2){
                                        echo 'reserve-apply';
                                    }
                                }
                            ?>" style="left: <?php echo $one_minute_length * ($reserve['start']-$available_time_from*60); ?>%;  width: <?php echo $one_minute_length * ($reserve['width']+$reserve['interval']); ?>%; height: 50px; display: flex; position: absolute;">
                                <div class="reserve_item" style="width:<?php echo  $reserve['width']/($reserve['width']+$reserve['interval'])*100; ?>%">
                                    <div class="reserve_user">
                                        <span class="sex <?php echo $reserve['user_sex']==1 ? 'sex_1' : 'sex2'; ?>"><?php echo $reserve['user_sex']==1 ? '男' : '女'; ?></span>
                                        <span><?php echo $reserve['user_name']; ?></span>
                                    </div>
                                    <div class="reserve_time">
                                        <span><?php echo $reserve['from'].'~'.$reserve['to']; ?></span>
                                    </div>
                                    <div class="sel_staff">
                                        <span class="sel_staff_mark">指名</span>
                                    </div>
                                </div>
                            </div>
                        <?php } ?>
                    </div>
                </div>
            <?php } ?>

            <?php }
            if($mod != 'shift'){ ?>
            <?php if($mod=='both'){ ?>
                <div class="shift_item_title">ブース</div>
            <?php } ?>
            <?php foreach ($tables as $table){ ?>
                <div class="epark_content_row" style="display: flex;">

                    <div class="staff_drag_item">
                        <div style="width: 100%;"><?php echo $table['table_title']; ?></div>
                        <i class="icon-lock"></i>
                    </div>

                    <div style="width: 100%; display: flex;position:relative; background-color: #b5b5b5;">

                                <div class="" style="left: <?php echo $one_minute_length * ($table_start_time-$available_time_from*60); ?>%;  width: <?php echo $one_minute_length * $table_length; ?>%; height: 50px; display: flex; position: absolute; border-right: solid #a3a3a3 1px; background-color: white;">
                                    <?php for($t = $table_start_time; $t<$table_start_time + $table_length; $t+=5){ ?>
                                        <div style="width: <?php echo 5/$table_length*100; ?>%;" class="time_element <?php if ($t%60==0){ ?>time_border_left_2<?php  }elseif ($t%10==0){  ?>time_border_left<?php } ?>" title="<?php echo intval($t/60).':'.$t%60; ?>"></div>
                                    <?php } ?>
                                </div>
                    </div>
                </div>
            <?php } ?>
            <?php } ?>
        </div>
    </div>
</div>

<style>
    .staff_drag_item{
        width: 180px; background-color: white;
        height: 50px; display: flex;
        padding: 0 12px;
        align-items: center;
        cursor: pointer;
    }

    .staff_sex_1{ border-left: solid #6eade9 6px; }
    .staff_sex_2{ border-left: solid #ffa5a5 6px; }

    .time_element{
        height : 50px;
        box-sizing: content-box;
    }

    .time_element:hover{
        background-color: rgba(252, 86, 84, 0.4);
    }
    .time_border_left{
        border-left:solid #a3a3a3 1px;
    }
    .time_border_left_2{
        border-left:solid #a3a3a3 3px;
    }
    .shift-submit{ background-color:#92b4d5; }
    .shift-apply{ background-color:white; }
    .shift-reject{ background-color:#bd8f8f; }
    .shift-out{ background-color:#f3caf3; }
    .shift-reply{ background-color:#cbcbcb; }
    .shift-request{ background-color:#f1dcb2; }
    .shift-rest{ background-color:#727272; }

    .reserve-request:hover, .reserve-before:hover, .reserve-apply:hover{ border:solid #333333 3px; cursor: move;}
    .reserve-request{ background-color:#a4c19b; border:solid #33cc00 1px; }
    .reserve-request>div{ background-color: #6db357; color: white;}
    .reserve-apply{ background-color:#a5a5c5; border:solid #7171c5 1px; }
    .reserve-apply>div{ background-color: #8e8ebf; color: black;}
    .reserve-before{ background-color:#c1c1c1; border:solid #757575 1px; }
    .reserve-before>div{ background-color: #9d9d9d; color: black;}

    .reserve_item{padding: 1px;}
    .reserve_item div, .reserve_item span{ overflow:hidden; white-space: nowrap; font-size: 12px; line-height: 16px; color: #333333;}
    .reserve_item .sex { color: white; padding: 1px 2px;border-radius: 3px;}
    .reserve_item .sex_1 { background-color: #348add;}
    .reserve_item .sex_1 { background-color: #954a4a;}
    .reserve_item .sel_staff_mark{color: white; background-color: #c77016; padding: 0px 1px;border-radius: 3px;}
    .reserve-before .reserve_item span{ color: #eeeeee;}
    .reserve-before .sex, .reserve-before .sel_staff_mark{background-color: grey;}

    .shift_item_title{ color: #333333;padding: 4px 12px;background-color: #b5b5b5;border-bottom: solid #9e9e9e 1px;}
    /*.staff_drag_item:hover{*/
    /*    background-color: grey;*/
    /*}*/
</style>
<script>

    function change_view_mod(mod){
        $('#mod').val(mod);
        $('form').submit();
    }

    isDrop = false;
    $(function() {
        $('#receipt_date').datepicker({
            dateFormat: 'yy-mm-dd',
            autoclose: true,
            todayHighlight: true
        });
        $('.staff_drag_item').draggable({
            start: function(event, ui) {
                console.log('dragstart');
                $(this).css('z-index', 99999);
            },
            stop: function(event, ui) {
                $(this).css('left', ui.originalPosition.left);
                $(this).css('top', ui.originalPosition.top);
                if(isDrop){
                    alert('Not ready!');
                }
                isDrop = false;
            }
        });


        $( ".staff_drag_item" ).droppable({
            drop: function( event, ui ) {
                isDrop = true;
            }
        });
    });

    $('.epark_content .left_nav .nav_item').click(function(e){
        var nav_id = $(this).attr('nav_id');
        if(nav_id=='left_close'){
            $('#receipt_left_panel').hide();
            return;
        }
        if(nav_id=='left_user'){
            $('#receipt_left_panel').show();
            return;
        }
    });

</script>

