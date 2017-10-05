/* jQuery.Spinner V1.0 CopyRight (c) 2014 by:Loyaoo Taobao:http://isseven.taobao.com */

(function($) {

	$.fn.Spinner = function (opts) {

		var defaults = {value:1, min:1, len:3, max:99}
		var options = $.extend(defaults, opts)
		var keyCodes = {up:38, down:40}
		return this.each(function() {

            var _obj = $(this);
            var _defaultNum = _obj.attr("defaultNum");
            var cartId = _obj.attr("cartId");
            if(_defaultNum != undefined)
            {
                options.value = _defaultNum;
            }
			var a = $('<a></a>'); f(a,0,"Decrease","-");	//加
			var c = $('<a></a>'); f(c,0,"Increase","+");	//减
			var b = $('<input/>');f(b,1,"Amount");cv(0,_obj);	//值
			console.dir(_obj.attr("amount"));

            _obj.append(a).append(b).append(c);
			a.click(function(){
                b.val(b.val().replace(/[^\d]/g,''));
				var n = parseInt(b.val()||options.min) - 1;
				saveOrderInfo(cartId,n);
                cv(-1,_obj);
			});
			b.keyup(function(){
                b.val(b.val().replace(/[^\d]/g,''));
                var n = parseInt(b.val()||options.min);
                saveOrderInfo(cartId,n);
                cv(0,_obj);
			});
			c.click(function(){
                b.val(b.val().replace(/[^\d]/g,''));
                var n = parseInt(b.val()||options.min) + 1;
                saveOrderInfo(cartId,n);
                cv(+1,_obj);
			});
			b.bind('keyup paste change',function(e){
				e.keyCode==keyCodes.up&&cv(+1,_obj);
				e.keyCode==keyCodes.down&&cv(-1,_obj);
			});

			function cv(n,obj){
				b.val(b.val().replace(/[^\d]/g,''));
				bv=parseInt(b.val()||options.min)+n;
                obj.attr("amount",bv);
				bv>=options.min&&bv<=options.max&&b.val(bv);
				if(bv<=options.min){b.val(options.min);f(a,2,"DisDe","Decrease");}else{f(a,2,"Decrease","DisDe");}
				if(bv>=options.max){b.val(options.max);f(c,2,"DisIn","Increase");}else{f(c,2,"Increase","DisIn");}

				settleMoney();
			}

		});

		function f(o,t,c,s){
			t==0&&o.addClass(c).attr("href","javascript:void(0)").append("<i></i>").find("i").append(s);
			t==1&&o.addClass(c).attr({"value":options.value,"autocomplete":"off","maxlength":options.len});
			t==2&&o.addClass(c).removeClass(s);
		}
	}

})(jQuery);