// Prevent crashing all JS if we forgot to remove some console.log 
if (!(typeof console == "object")) {
    window['console'] = {
	'log' : function(arg) {},
	'error' : function(arg) {},
	'debug' : function(arg) {},
	'warn' : function(arg) {},
	'trace' : function(arg) {}
    }
}
