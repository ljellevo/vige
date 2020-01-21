package com.vige.components;

import com.vige.core.*;
import com.vige.support.*;
import com.vige.utils.*;

/*
import lib.components.Center.CenterAlignment;
import js.Browser;
import lib.support.Widget;
import lib.support.StyleManager;

import lib.utils.Color;
import lib.utils.Border;
import lib.utils.Padding;
import lib.utils.Margin;
import lib.utils.Size;
import lib.core.AssetManagement;
*/


/**
Not done
**/


/**
new Image({
    src: "./assets/code-icon.png",
    width: 100,
    minWidth: 20
})
**/

/**
    Needs resizeModifier documented
**/


enum ResizeModifier {
    Height;
    Width;
    None;
}


class Image implements Widget {

    var src: String;
    var alt: String;
    var height: Float;
    var minHeight: Float;
    var maxHeight: Float;
    var width: Float;
    var minWidth: Float;
    var maxWidth: Float;
    var resizeModifier: ResizeModifier;

    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;
    public var overflow: Overflow;


    public function new(arg: {
        src: String,
        ?alt: String,
        ?height: Float,
        ?minHeight: Float,
        ?maxHeight: Float,
        ?width: Float,
        ?minWidth: Float,
        ?maxWidth: Float,
        ?resizeModifier: ResizeModifier,

        ?color: Color,
        ?border: Border,
        ?padding: Padding,
        ?margin: Margin,
        ?size: Size, 
        ?overflow: Overflow,
    }) {
        this.src = arg.src;
        this.alt = arg.alt;
        this.height = arg.height;
        this.minHeight = arg.minHeight;
        this.maxHeight = arg.maxHeight;
        this.width = arg.width;
        this.minWidth = arg.minWidth;
        this.maxWidth = arg.maxWidth;
        this.resizeModifier = arg.resizeModifier != null ? arg.resizeModifier : ResizeModifier.Width;

        this.color = arg.color;
        this.border = arg.border;
        this.padding = arg.padding;
        this.margin = arg.margin;
        this.size = arg.size;
        this.overflow = arg.overflow;
    }

    public function init(){}
    
    public function render():js.html.Node {
        var container = Browser.document.createImageElement();

        container.src = new AssetManagement(src).getAssetPath();
        container.alt = alt;
        container.style.display = "block";
        container.style.objectFit = "contain";

        switch (resizeModifier) {
            case Height:
                container.style.height = "100%";
                container.style.width = "auto";
            case Width:
                container.style.height = "auto";
                container.style.width = "100%";
            case None:
                container.style.height = "auto";
                container.style.width = "auto";

        }


        if(height != null){
            container.style.height = Std.string(height) + "px";
        }

        if(width != null) {
            container.style.width = Std.string(width) + "px";
        }

        if(minWidth != null) {
            container.style.minWidth = Std.string(minWidth) + "px";
        }

        if(minHeight != null) {
            container.style.minHeight = Std.string(minHeight) + "px";
        }

        if(maxWidth != null) {
            container.style.maxWidth = Std.string(maxWidth) + "px";
        }

        if(maxHeight != null) {
            container.style.maxHeight = Std.string(maxHeight) + "px";
        }
        
        new StyleManager().addStyleToImage({widget: container, color: color, border: border, padding: padding, margin: margin, size: size, overflow: overflow});

        return container;
    }
}