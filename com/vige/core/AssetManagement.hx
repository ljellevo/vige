package com.vige.core;

import js.Browser;
import com.vige.components.*;
import com.vige.core.*;
import com.vige.support.*;
import com.vige.utils.*;

/*
import js.Browser;
*/
class AssetManagement {
    var src: String;

    public function new(
        src: String
    ){
        this.src = src;
    }

    public function getAssetPath():String {
        //     "./assets/logo-verbose.png"

        
        var url = Browser.location.pathname;
        var paths = url.split("/"); //Used to count amount of reversing
        var result = "";

        if(paths.length <= 2) {
            return src;
        } else {
            var correctedSrc = "";
            for(i in 0...paths.length - 2) {
                correctedSrc += "/..";
            }
            
            var folder = src.split(".");
            correctedSrc += folder[1] + "." + folder[2];
            return correctedSrc;
        }


        /*
        var reversing = "";
        for(i in 0...paths.length -1) {
            reversing += ""
        }
        */
        

        return "/";
    }


}