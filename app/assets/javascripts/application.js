// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require bxslider
//= require activestorage
//= require turbolinks
//= require popper
//= require bootstrap
//= require_tree .


// ラジオボタン、デザイン料表示非表示
$(function() {
  $('input[id=isRadio]').change( function(){
    // 表示・非表示切り替え
    $('#workprice').toggle();
  });
});




// works作品表示変換
// 遷移後の処理
$(function(){
    $(document).ready(function(){
        $('.work-scroll').hide();
        $('.box-mayworks').hide();
        $('.work-slider').show();
    });
});

// icon1
$(function(){
    $('.icon1').mouseover(function(){
        $('.icon1').css({'color': '#FFD700'});
    });

    $('.icon1').on('click', function(){
        $('.work-slider').hide();
        $('.box-mayworks').hide();
        $('.work-scroll').show();
    });

    $('.icon1').mouseout(function(){
        $('.icon1').css({'color': '#FFF'});
    });
});

// icon2
$(function(){
    $('.icon2').mouseover(function(){
        $('.icon2').css({'color': '#FFD700'});
    });

    $('.icon2').on('click', function(){
        $('.work-scroll').hide();
        $('.box-mayworks').hide();
        $('.work-slider').show();
    });

    $('.icon2').mouseout(function(){
        $('.icon2').css({'color': '#FFF'});
    });
});

// icon3
$(function(){
    $('.icon3').mouseover(function(){
        $('.icon3').css({'color': '#FFD700'});
    });

    $('.icon3').on('click', function(){
        $('.work-scroll').hide();
        $('.work-slider').hide();
        $('.box-mayworks').show();
    });

    $('.icon3').mouseout(function(){
        $('.icon3').css({'color': '#FFF'});
    });
});


// Good機能
$(function() {
    $(document).on("ajax:success", ".fav", function(e) {
    	console.log(e)
    	if ($(e.target).data("method") == "post") {
    		console.log($(e.target).data("method"))
       	   $('.' + e.detail[0].id).html(e.detail[0].goods.length + " Good − ");
       	   $(e.target).attr("data-method","delete");
    	   $(e.target).data("method","delete");
    	} else {
    		console.log($(e.target).data("method"))
    	   $('.' + e.detail[0].id).html(e.detail[0].goods.length + " Good ＋ ");
    	   $(e.target).attr("data-method","post");
    	   $(e.target).data("method","post");
    	}
    });
});

// モーダルウィンドウ
$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').trigger('focus')
})


