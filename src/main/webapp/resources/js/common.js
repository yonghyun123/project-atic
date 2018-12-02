/*
name : common.js 
*/

/* 토스트 출력 메서드 */
function popup(flag) {
	x = document.getElementById(flag);
	setTimeout(function(){ x.className = "show"; }, 1500);
	setTimeout(function(){ x.className = ""; }, 3000);
}


/* 닉네임 유효성검사 메서드 */ 
function nicknameValidation(nickname, selector) {
	var regName = /^[가-힣0-9]{2,6}$|^[a-zA-Z0-9]{2,12}$/;
	if(nickname.trim().length == 0) {
		messageView(selector, "닉네임을 입력해주세요.");
		return false;
	}else if (nickname.trim().length < 2) {
		messageView(selector, "닉네임을 2자 이상 입력해주세요.");
	}else {
		if(regName.test(nickname)) {
			return true;
		} else {
			messageView(selector, "한글+숫자 6자, 영어+숫자 12자까지 가능합니다.");
			return false;
		}				
	}
}

/* 에러메세지 출력 메서드 */
function messageView(selector, message) {
	var count = 0;
	var fadeIn = setInterval( function() {
		selector.style.visibility = 'visible';
		selector.innerHTML = message;
		if(count >= 5) {
			selector.style.visibility = 'hidden';
			clearInterval(fadeIn);
			return ;
		}
		count++;
	}, 500);
}

/* Start Channel Plugin */
window.channelPluginSettings = {
  "pluginKey": "b069aa92-f615-4c52-8447-4180a1cfb081"
};

(function() {
	var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var d = window.document;
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
})();

$('#loanBtn').click(function(){
	location.href = "/loan";
});

