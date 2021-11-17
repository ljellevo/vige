package com.vige.components;

import js.lib.RegExp;
import com.vige.core.*;
import com.vige.support.*;
import com.vige.utils.*;
import com.vige.support.Enums;
import js.Browser;
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
*/

/**
Not done
**/
/**
    Is documented
**/

class InputController {
  var element: js.html.InputElement;

  public function new(){}


  public function getElement(): js.html.InputElement {
    return element;
  }

  public function setElement(newElement: js.html.InputElement) {
    element = newElement;
  }

  public function getValue(): String {
    if(element != null) {
      if(element.checked == true) {
        return "checked";
      }
      return element.value;
    } else {
      return "";
    } 
  }
}

class Input implements Widget {
  var type: InputType;
  var controller: InputController;
  var value: String = "";
  var checked: Bool;
  var placeholder: String = "";
  var autofocus: Bool = false;
  var pattern: String = "(.*?)";
  var readOnly: Bool = false;
  var required: Bool = false;
  var onChange: haxe.Constraints.Function;
  var onClick: haxe.Constraints.Function;

  

  public var color: Color;
  public var border: Border;
  public var padding: Padding;
  public var margin: Margin;
  public var size: Size;
  public var overflow: Overflow;
  public var shadow: Array<Shadow>;

  public function new(arg: {
    type: InputType,
    controller: InputController,
    ?value: String,
    ?checked: Bool,
    ?placeholder: String,
    ?autofocus: Bool,
    ?pattern: String,
    ?readOnly: Bool,
    ?required: Bool,
    ?onChange: haxe.Constraints.Function,
    ?onClick: haxe.Constraints.Function,

    
    ?color: Color,
    ?border: Border,
    ?padding: Padding,
    ?margin: Margin,
    ?size: Size, 
    ?overflow: Overflow,
    ?shadow: Array<Shadow>
  }) {
    this.type = arg.type;
    this.controller = arg.controller;
    this.value = arg.value != null ? arg.value : "";
    this.checked = arg.checked;
    this.placeholder = arg.placeholder != null ? arg.placeholder : "";
    this.autofocus = arg.autofocus != null ? arg.autofocus : false;
    this.pattern = arg.pattern != null ? arg.pattern : "(.*?)";
    this.readOnly = arg.readOnly != null ? arg.readOnly : false;
    this.required = arg.required != null ? arg.required : false;
    this.onChange = arg.onChange;
    this.onClick = arg.onClick;
    

    this.color = arg.color;
    this.border = arg.border;
    this.padding = arg.padding;
    this.margin = arg.margin;
    this.size = arg.size != null ? arg.size : new Size({height: "100%", width: "100%"});
    this.overflow = arg.overflow;
  }

  public function init(){}
  
  public function render():js.html.Node {
    /*
    var container = Browser.document.createDivElement();
    container.classList.add("container");
    container.style.boxSizing = "border-box";
    if(child != null) {
        container.appendChild(child.render());
    }

    if(size != null) {
      container.id = size.getWidth();
    }
    
    return container;
    */
    var input = Browser.document.createInputElement();
    //input.type = 
    switch (type) {
      case Button:
        input.type = "button";
      case Checkbox:
        input.type = "checkbox";
      case Color:
        input.type = "color";
      case DateTime:
        input.type = "date";
      case DatetimeLocal:
        input.type = "datetime-local";
      case Email:
        input.type = "email";
      case File:
        input.type = "file";
      case Hidden:
        input.type = "hidden";
      case Image:
        input.type = "image";
      case Month:
        input.type = "month";
      case Number:
        input.type = "number";
      case Password:
        input.type = "password";
      case Radio:
        input.type = "radio";
      case Range:
        input.type = "range";
      case Reset:
        input.type = "reset";
      case Search:
        input.type = "search";
      case Submit:
        input.type = "submit";
      case Tel:
        input.type = "tel";
      case Text:
        input.type = "text";
      case Time:
        input.type = "time";
      case Url:
        input.type = "url";
      case Week:
        input.type = "week";
    }

    input.value = value;
    input.placeholder = placeholder;
    input.autofocus = autofocus;
    input.pattern = pattern;
    input.readOnly = readOnly;
    input.required = required;
    if(onChange != null) {
      //input.onchange = onchange;
      input.onkeyup = onChange;
    }

    if(onClick != null) {
      input.onclick = onClick;
    }

    if(checked != null) {
      input.checked = checked;
    }
    

    //

    new StyleManager().addStyleToInput({widget: input, color: color, border: border, padding: padding, margin: margin, size: size, overflow: overflow});        


    controller.setElement(input);
    return input;
  }
}