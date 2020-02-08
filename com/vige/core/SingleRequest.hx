package com.vige.core;

import com.vige.components.*;
import com.vige.core.*;
import com.vige.support.*;
import com.vige.utils.*;
import com.akifox.asynchttp.HttpResponse;
import com.akifox.asynchttp.HttpRequest;
/**
    Is documented
**/
/*

import js.Browser;
*/

/**
  new SingleRequest({
    url: "http://localhost:3000/database/" + operation,
    method: "GET",
    onComplete: function(res: HttpResponse) {
      setState(this, function(){
        status = res.content;
      });
    },
    onProgress: function() {
      setState(this, function(){
        status = "Loading";
      });
    }
  }).request();
**/

class SingleRequest {
    var url: String = "";
    var method: String;
    var content: Dynamic;
    var contentType: String;
    var onComplete: haxe.Constraints.Function = null;
    var onProgress: haxe.Constraints.Function = null;
    var onError: haxe.Constraints.Function = null;

    public function new(
    arg: {
        url: String,
        ?method: String,
        ?content: Dynamic,
        ?contentType: String,
        onComplete: haxe.Constraints.Function,
        onProgress: haxe.Constraints.Function,
        ?onError: haxe.Constraints.Function
    }){
        this.url = arg.url;
        this.method = arg.method != null ? arg.method : "GET";
        this.content = arg.content;
        this.contentType = arg.contentType;
        this.onComplete = arg.onComplete;
        this.onProgress = arg.onProgress;
        this.onError = arg.onError;
    }


    public function request(): HttpRequest{
        onProgress();
        var request = new HttpRequest({
            url : url,
            method: method,
            content: content,
            contentType: contentType,
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