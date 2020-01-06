package lib.core;

import haxe.display.Protocol.Response;
import com.akifox.asynchttp.HttpResponse;
import com.akifox.asynchttp.HttpRequest;
import js.Browser;

/**
    new SingleRequest({
        url: "http://localhost:3000/database/" + operation,
        method: "GET",
        onComplete: function(res: HttpResponse) {
          trace(res);
          setState(this, function(){
            status = res.content;
          });
        },
        onProgress: function() {
          trace("working");
          setState(this, function(){
            status = "Loading";
          });
        }
      }).request();
**/

class SingleRequest {
    var url: String = "";
    var method: String;
    var onComplete: haxe.Constraints.Function = null;
    var onProgress: haxe.Constraints.Function = null;
    var onError: haxe.Constraints.Function = null;

    public function new(
    arg: {
        url: String,
        ?method: String,
        onComplete: haxe.Constraints.Function,
        onProgress: haxe.Constraints.Function,
        ?onError: haxe.Constraints.Function
    }){
        this.url = arg.url;
        this.method = arg.method != null ? arg.method : "GET";
        this.onComplete = arg.onComplete;
        this.onProgress = arg.onProgress;
        this.onError = arg.onError;
    }


    public function request(): HttpRequest{
        onProgress();
        var request = new HttpRequest({
            url : url,
            method: method,
            callback : function(response:HttpResponse):HttpResponse {
                if(response.isOK) {
                    return onComplete(response);
                } else {
                    return onError(response);
                }  
            }  
          });
        request.send();   
        return request;   
      }
}