/*
name : countTime.js
*/
(function($){
	var opt,ele,top;

	$.fn.countTime = function(option){
		ele = $(this);
		opt = option;
		date = strToTime(opt.time);
		
		timePrint();

		var time = setInterval(function(){timePrint();},1000);

		function strToTime(str){
			
			y = parseInt(str.substr(0,4));
			m = parseInt(str.substr(5,2))-1;
			d = parseInt(str.substr(8,2));
			h = parseInt(str.substr(11,2));
			i = parseInt(str.substr(14,2));
			s = parseInt(str.substr(17,2));

			tmp = new Date(y,m,d,h,i,s);
			
			return sec(tmp);
		}

		function timeToStr(sec){
			
			str = '';

			d = Math.floor(sec/(60*60*24));
			mod = (sec%(60*60*24));

			h = addZero(Math.floor(mod/(60*60)),2);
			mod = (mod%(60*60));
			
			i = addZero(Math.floor(mod/60),2);
			mod = (mod%60);

			s = addZero(Math.floor(mod),2);
			
			if(d!=0) {
				str = 'D'+(d*(-1)) ;
				$('#countTime').css("color","black").css("font-size","larger").css("font-weight","bold");
				} else if(d==0){
				str = 'D-day';
				$('#countTime').css("color","red").css("font-size","larger").css("font-weight","bold");
			};
			
			if(h<0) h = addZero(h*(-1),2);
			if(s<0) s = addZero(s*(-1),2);
	
			str += '\t'+ h+':'+i+':'+s;

			return str;
		}

		function sec(date){
			return Math.floor(date.getTime()/1000);
		}

		function addZero(data, len) {
			data= '000000000000000'+data;
			return data.substr(data.length - len, len);
		}

		function timePrint(){
			now = sec(new Date());
			result = date-now;
			ele.empty();
			if(result ==0){
				clearInterval(time);
				ele.append('종료');
			} else {
				ele.append(timeToStr(result));
			}
		}
		
	}

})(jQuery);