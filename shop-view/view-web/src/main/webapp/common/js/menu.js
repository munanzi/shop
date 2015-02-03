$(function() {
    if($('.asideMenu').size() == 0) {
        return;
    }
    var $hover = $('.asideMenu a.hover');
    var tp = $hover.position().top;
    var $tip = $('.menuTip');
    $('.asideMenu > li').hover(function() {
        var top = $(this).find("a").position().top;
        $tip.stop();
        $tip.animate({top : top + 9}, 200);
    });
    $('.asideMenu').on("mouseleave", function() {
        $tip.stop();
        $tip.animate({top : tp + 9}, 200);
    });
    $tip.css("top", tp + 9);

    function selectMenu($li) {
        $hover.removeClass('hover');
        
        var top = $li.find("a").position().top;
        $tip.stop();
        $tip.animate({top : top + 9}, 200);
        
        $hover = $li.find("a").addClass('hover');
        tp = $hover.position().top;
    }
    
    window.setSelectedMenu = function($menu) {
        selectMenu($menu);
    }; 
});

dialogOption = {
        addShadow:function (obj){
            var shadow = '<div id="user_shadow"></div>';
            if($("#user_shadow")[0]){
                $("#user_shadow").show();   
            }else{
                obj.append(shadow);
            }
        },
        
        popWin:function (obj){
            var h = obj.height(),
                w = obj.width();
            obj.css({"position":"fixed","left":"50%","top":"50%","margin-left":-w/2,"margin-top":-h/2,"z-index":"100000"});
            obj.show();
        },
        
        closeWin:function (obj){
            obj.hide();
            $("#user_shadow").hide();
        }
    }

    //弹出窗口
    function showPopWin(obj){
        dialogOption.popWin( obj );
        dialogOption.addShadow( $("body") );
    }

    //关闭窗口
    function hidePopWin( obj ){
        dialogOption.closeWin( obj );
    }
