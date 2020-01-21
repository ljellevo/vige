package com.vige.components;

import com.vige.core.*;
import com.vige.support.*;
import com.vige.utils.*;

/*
import lib.support.StreamConnection;
import js.html.Node;
import lib.core.GlobalState;
import lib.support.Widget;
import js.Browser;

import lib.utils.Color;
import lib.utils.Border;
import lib.utils.Padding;
import lib.utils.Margin;
import lib.utils.Size;
*/

/**
new Stream(page, {
    url: "ws://example.com",
    onStandby: function() {
        return new Text("On standby");
    },
    onOpen: function(res: Event) {
        return new Text("Connection open");
    },
    onMessage: function(res: MessageEvent) {
        return new Text(res.data);
    },
    onClose: function(res: CloseEvent) {
        return new Text("Connection closed");
    },
    onError: function(res: ErrorEvent) {
        return new Text("Error");
    },
})
**/

/**
    Is documented
**/

class Stream implements Widget{
    var url: String = "";
    var page: Page = null;
    var onStandby: haxe.Constraints.Function = null;
    var onOpen: haxe.Constraints.Function = null;
    var onMessage: haxe.Constraints.Function = null;
    var onClose: haxe.Constraints.Function = null;
    var onError: haxe.Constraints.Function = null;

    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;
    public var overflow: Overflow;


    public function new(page: Page, arg: {
        url: String,
        onStandby: haxe.Constraints.Function,
        onOpen: haxe.Constraints.Function,
        onMessage: haxe.Constraints.Function,
        onClose: haxe.Constraints.Function,
        ?onError: haxe.Constraints.Function
    }){
        this.url = arg.url;
        this.page = page;
        this.onStandby = arg.onStandby;
        this.onOpen = arg.onOpen;
        this.onMessage = arg.onMessage;
        this.onClose = arg.onClose;
        this.onError = arg.onError;
    }

    public function init(){}


    function replace(container: js.html.DivElement, onProgressNode: js.html.Node, component: Widget): Node {
        container.removeChild(onProgressNode);
        return container.appendChild(component.render());
    }
    
    public function render():js.html.Node {
        var container = Browser.document.createDivElement();        
        var lastComponent = container.appendChild(onStandby().render());

        //var socket = new WebSocket(url);
        var streamConnection = new StreamConnection(url, Browser.location.pathname);
        streamConnection.getSocket().onopen = function (res) {
            GlobalState.instance.openStream(streamConnection);
            var component = onOpen();
            lastComponent = replace(container, lastComponent, component);
        }

        streamConnection.getSocket().onmessage = function (message) {
            var component = onMessage(message);
            lastComponent = replace(container, lastComponent, component);
        }

        streamConnection.getSocket().onclose = function (res) {
            var component = onClose();
            lastComponent = replace(container, lastComponent, component);
        }

        streamConnection.getSocket().onerror = function (error) {
            var component = onError(error);
            lastComponent = replace(container, lastComponent, component);
        }

        return container;
    }
}