package com.vige.support;

import com.vige.components.*;
import com.vige.components.Row.*;
import com.vige.core.*;
import com.vige.support.*;
import com.vige.utils.*;
import com.vige.support.Enums;

/*
import lib.support.Widget.Overflow;
import lib.utils.Margin;
import lib.components.Row;
import lib.utils.Padding;
import lib.utils.Border;
import lib.utils.Size;
import lib.utils.Color;
*/




class StyleManager {

  public function new (){}

  public function addStyleToDiv(arg: {
    ?size: Size, 
    widget: js.html.DivElement, 
    ?color: Color,
    ?padding: Padding,
    ?margin: Margin,
    ?mainAxisAlignment: MainAxisAlignment,
    ?crossAxisAlignment: CrossAxisAlignment,
    ?type: DivType,
    ?border: Border,
    ?overflow: Overflow,
    ?shadow: Array<Shadow>
  }): js.html.Node {

    if(arg.type == null) {
      arg.type = DivType.Other;
    }
    if(arg.size != null){
      arg.widget.style.minHeight = arg.size.getMinHeight();
      arg.widget.style.minWidth = arg.size.getMinWidth();
      arg.widget.style.height = arg.size.getHeight();
      arg.widget.style.width = arg.size.getWidth();
      arg.widget.style.maxHeight = arg.size.getMaxHeight();
      arg.widget.style.maxWidth = arg.size.getMaxWidth();
    }
    if(arg.color != null){
      arg.widget.style.backgroundColor = arg.color.getBackgroundColor();
      arg.widget.style.color = arg.color.getColor();
    }
    
    if(arg.padding != null){
      arg.widget.style.padding = arg.padding.getPadding();
    }
    
    if(arg.margin != null){
      arg.widget.style.margin = arg.margin != null ? arg.margin.getMargin() : Margin.all(0.0).getMargin();
    }

    if(arg.border != null){
      switch (arg.border.getSides()){
        case Top:
          arg.widget.style.borderTop = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
        case Right:
          arg.widget.style.borderRight = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
        case Bottom:
          arg.widget.style.borderBottom = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
        case Left:
          arg.widget.style.borderLeft = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
        case All:
          arg.widget.style.border = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
      }
      arg.widget.style.borderRadius = arg.border.getCornerRadius();
    }

    if(arg.overflow != null) {
      switch (arg.overflow) {
        case Visible:
          arg.widget.style.overflow = "visible";
        case Hidden:
          arg.widget.style.overflow = "hidden";
        case Scroll:
          arg.widget.style.overflow = "scroll";
        case Auto:
          arg.widget.style.overflow = "auto";
        case Initial:
          arg.widget.style.overflow = "initial";
        case Inherit:
          arg.widget.style.overflow = "inherit";
      }
    }
      
      
      
    if(arg.mainAxisAlignment != null) {
      switch (arg.mainAxisAlignment){
        case TopLeft:
          arg.widget.style.placeItems = "start start";
        case TopCenter:
          arg.widget.style.placeItems = "start center";
        case TopRight:
          arg.widget.style.placeItems = "start end";
        case Left:
          arg.widget.style.placeItems = "center start";
        case Center:
          arg.widget.style.placeItems = "center center";
        case Right:
          arg.widget.style.placeItems = "center end";
        case LowerLeft:
          arg.widget.style.placeItems = "end start";
        case LowerCenter:
          arg.widget.style.placeItems = "end center";
        case LowerRight:
          arg.widget.style.placeItems = "end end";
        case Stretch:
          arg.widget.style.placeItems = "stretch";
      }
    }

    if(arg.type == DivType.Row) {
      if(arg.crossAxisAlignment != null) {
        switch (arg.crossAxisAlignment){
          case Stretch:
            arg.widget.style.justifyContent = null;
          case Center:
            arg.widget.style.justifyContent = "center";
          case FlexStart:
            arg.widget.style.justifyContent = "flex-start";
          case FlexEnd:
            arg.widget.style.justifyContent = "flex-end";
          case SpacedEvenly:
            arg.widget.style.justifyContent = "space-evenly";
          case SpaceBetween:
            arg.widget.style.justifyContent = "space-between";
          case SpaceAround:
            arg.widget.style.justifyContent = "space-around";
          case Initial:
            arg.widget.style.justifyContent = "initial";
          case Inherit:
            arg.widget.style.justifyContent = "inherit";
        }
      }
    } else if(arg.type == DivType.Column) {
      if(arg.crossAxisAlignment != null) {
        switch (arg.crossAxisAlignment){
          case Stretch:
            arg.widget.style.alignContent = "stretch";
          case Center:
            arg.widget.style.alignContent = "center";
          case FlexStart:
            arg.widget.style.alignContent = "flex-start";
          case FlexEnd:
            arg.widget.style.alignContent = "flex-end";
          case SpacedEvenly:
            arg.widget.style.alignContent = "space-evenly";
          case SpaceBetween:
            arg.widget.style.alignContent = "space-between";
          case SpaceAround:
            arg.widget.style.alignContent = "space-around";
          case Initial:
            arg.widget.style.alignContent = "initial";
          case Inherit:
            arg.widget.style.alignContent = "inherit";
        }
      }
    }

    if(arg.shadow != null && arg.shadow.length > 0) {
      trace("Shadow was found");
      
      var joinedString = "";
      for(i in 0...arg.shadow.length) {
        if(i != 0) {
          joinedString += ", ";
        }
        joinedString += arg.shadow[i].getShadow();
      }
      trace("Box-shadow test: " + joinedString);
      arg.widget.style.boxShadow = joinedString;
    }
    
    return arg.widget;
  }


  public function addStyleToButton(arg: {
    widget: js.html.ButtonElement, 
    ?size: Size, 
    ?color: Color,
    ?padding: Padding,
    ?margin: Margin,
    ?border: Border,
    ?overflow: Overflow,
    ?shadow: Array<Shadow>
  }): js.html.Node {

    if(arg.size != null){
      arg.widget.style.minHeight = arg.size.getMinHeight();
      arg.widget.style.minWidth = arg.size.getMinWidth();
      arg.widget.style.height = arg.size.getHeight();
      arg.widget.style.width = arg.size.getWidth();
      arg.widget.style.maxHeight = arg.size.getMaxHeight();
      arg.widget.style.maxWidth = arg.size.getMaxWidth();
    }
    if(arg.color != null){
      arg.widget.style.backgroundColor = arg.color.getBackgroundColor();
      arg.widget.style.color = arg.color.getColor();
    }
    
    if(arg.padding != null){
      arg.widget.style.padding = arg.padding.getPadding();
    }
    
    if(arg.margin != null){
      arg.widget.style.margin = arg.margin.getMargin();
    }

    if(arg.overflow != null) {
      switch (arg.overflow) {
        case Visible:
          arg.widget.style.overflow = "visible";
        case Hidden:
          arg.widget.style.overflow = "hidden";
        case Scroll:
          arg.widget.style.overflow = "scroll";
        case Auto:
          arg.widget.style.overflow = "auto";
        case Initial:
          arg.widget.style.overflow = "initial";
        case Inherit:
          arg.widget.style.overflow = "inherit";
      }
    }

    if(arg.border != null){
      switch (arg.border.getSides()){
        case Top:
          arg.widget.style.borderTop = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
        case Right:
          arg.widget.style.borderRight = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
        case Bottom:
          arg.widget.style.borderBottom = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
        case Left:
          arg.widget.style.borderLeft = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
        case All:
          arg.widget.style.border = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
          
        }
      arg.widget.style.borderRadius = arg.border.getCornerRadius();
    }

    if(arg.shadow != null && arg.shadow.length > 0) {
      arg.widget.style.boxShadow = arg.shadow.join(", ");
    }
      return arg.widget;
  }

  public function addStyleToAnchor(arg: {
    widget: js.html.AnchorElement, 
    ?size: Size, 
    ?color: Color,
    ?padding: Padding,
    ?margin: Margin,
    ?border: Border,
    ?overflow: Overflow,
    ?shadow: Array<Shadow>
  }): js.html.Node {

    if(arg.size != null){
      arg.widget.style.minHeight = arg.size.getMinHeight();
      arg.widget.style.minWidth = arg.size.getMinWidth();
      arg.widget.style.height = arg.size.getHeight();
      arg.widget.style.width = arg.size.getWidth();
      arg.widget.style.maxHeight = arg.size.getMaxHeight();
      arg.widget.style.maxWidth = arg.size.getMaxWidth();
    }
    if(arg.color != null){
      arg.widget.style.backgroundColor = arg.color.getBackgroundColor();
      arg.widget.style.color = arg.color.getColor();
    }
    
    if(arg.padding != null){
      arg.widget.style.padding = arg.padding.getPadding();
    }
    
    if(arg.margin != null){
      arg.widget.style.margin = arg.margin.getMargin();
    }

    if(arg.overflow != null) {
      switch (arg.overflow) {
        case Visible:
          arg.widget.style.overflow = "visible";
        case Hidden:
          arg.widget.style.overflow = "hidden";
        case Scroll:
          arg.widget.style.overflow = "scroll";
        case Auto:
          arg.widget.style.overflow = "auto";
        case Initial:
          arg.widget.style.overflow = "initial";
        case Inherit:
          arg.widget.style.overflow = "inherit";
      }
    }

    if(arg.border != null){
      switch (arg.border.getSides()){
        case Top:
          arg.widget.style.borderTop = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
        case Right:
          arg.widget.style.borderRight = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
        case Bottom:
          arg.widget.style.borderBottom = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
        case Left:
          arg.widget.style.borderLeft = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
        case All:
          arg.widget.style.border = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
          
        }
      arg.widget.style.borderRadius = arg.border.getCornerRadius();
    }

    if(arg.shadow != null && arg.shadow.length > 0) {
      arg.widget.style.boxShadow = arg.shadow.join(", ");
    }
      return arg.widget;
  }

  public function addStyleToImage(arg: {
    widget: js.html.ImageElement, 
    ?size: Size, 
    ?color: Color,
    ?padding: Padding,
    ?margin: Margin,
    ?border: Border,
    ?overflow: Overflow,
    ?shadow: Array<Shadow>
  }): js.html.Node {

      
      if(arg.size != null){
        arg.widget.style.minHeight = arg.size.getMinHeight();
        arg.widget.style.minWidth = arg.size.getMinWidth();
        arg.widget.style.height = arg.size.getHeight();
        arg.widget.style.width = arg.size.getWidth();
        arg.widget.style.maxHeight = arg.size.getMaxHeight();
        arg.widget.style.maxWidth = arg.size.getMaxWidth();
      }
      
      if(arg.color != null){
          arg.widget.style.backgroundColor = arg.color.getBackgroundColor();
          arg.widget.style.color = arg.color.getColor();
      }
      
      if(arg.padding != null){
          arg.widget.style.padding = arg.padding.getPadding();
      }
      
      if(arg.margin != null){
          arg.widget.style.margin = arg.margin.getMargin();
      }

      if(arg.overflow != null) {
        switch (arg.overflow) {
          case Visible:
            arg.widget.style.overflow = "visible";
          case Hidden:
            arg.widget.style.overflow = "hidden";
          case Scroll:
            arg.widget.style.overflow = "scroll";
          case Auto:
            arg.widget.style.overflow = "auto";
          case Initial:
            arg.widget.style.overflow = "initial";
          case Inherit:
            arg.widget.style.overflow = "inherit";
        }
      }

      if(arg.border != null){
          switch (arg.border.getSides()){
              case Top:
                  arg.widget.style.borderTop = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
              case Right:
                  arg.widget.style.borderRight = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
              case Bottom:
                  arg.widget.style.borderBottom = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
              case Left:
                  arg.widget.style.borderLeft = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
              case All:
                  arg.widget.style.border = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
              
          }
          arg.widget.style.borderRadius = arg.border.getCornerRadius();

      }


      if(arg.shadow != null && arg.shadow.length > 0) {
        arg.widget.style.boxShadow = arg.shadow.join(", ");
      }
      
      return arg.widget;
  }

  public function addStyleToEmbeded(arg: {
    ?size: Size, 
    widget: js.html.EmbedElement, 
    ?color: Color,
    ?padding: Padding,
    ?margin: Margin,
    ?mainAxisAlignment: MainAxisAlignment,
    ?crossAxisAlignment: CrossAxisAlignment,
    ?border: Border,
    ?overflow: Overflow,
    ?shadow: Array<Shadow>
  }): js.html.Node {
      if(arg.size != null){
        arg.widget.style.minHeight = arg.size.getMinHeight();
        arg.widget.style.minWidth = arg.size.getMinWidth();
        arg.widget.style.height = arg.size.getHeight();
        arg.widget.style.width = arg.size.getWidth();
        arg.widget.style.maxHeight = arg.size.getMaxHeight();
        arg.widget.style.maxWidth = arg.size.getMaxWidth();
      }
      if(arg.color != null){
          arg.widget.style.backgroundColor = arg.color.getBackgroundColor();
          arg.widget.style.color = arg.color.getColor();
      }
      
      if(arg.padding != null){
          arg.widget.style.padding = arg.padding.getPadding();
      }
      
      if(arg.margin != null){
          arg.widget.style.margin = arg.margin != null ? arg.margin.getMargin() : Margin.all(0.0).getMargin();
      }

      if(arg.overflow != null) {
        switch (arg.overflow) {
          case Visible:
            arg.widget.style.overflow = "visible";
          case Hidden:
            arg.widget.style.overflow = "hidden";
          case Scroll:
            arg.widget.style.overflow = "scroll";
          case Auto:
            arg.widget.style.overflow = "auto";
          case Initial:
            arg.widget.style.overflow = "initial";
          case Inherit:
            arg.widget.style.overflow = "inherit";
        }
      }

      if(arg.border != null){
          switch (arg.border.getSides()){
              case Top:
                  arg.widget.style.borderTop = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
              case Right:
                  arg.widget.style.borderRight = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
              case Bottom:
                  arg.widget.style.borderBottom = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
              case Left:
                  arg.widget.style.borderLeft = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
              case All:
                  arg.widget.style.border = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
              
          }
          arg.widget.style.borderRadius = arg.border.getCornerRadius();

      }
      
      
      
      if(arg.mainAxisAlignment != null) {
          switch (arg.mainAxisAlignment){
              case TopLeft:
                  arg.widget.style.placeItems = "start start";
              case TopCenter:
                  arg.widget.style.placeItems = "start center";
              case TopRight:
                  arg.widget.style.placeItems = "start end";
              case Left:
                  arg.widget.style.placeItems = "center start";
              case Center:
                  arg.widget.style.placeItems = "center center";
              case Right:
                  arg.widget.style.placeItems = "center end";
              case LowerLeft:
                  arg.widget.style.placeItems = "end start";
              case LowerCenter:
                  arg.widget.style.placeItems = "end center";
              case LowerRight:
                  arg.widget.style.placeItems = "end end";
              case Stretch:
                  arg.widget.style.placeItems = "stretch";
          }
      }

      if(arg.shadow != null && arg.shadow.length > 0) {
        arg.widget.style.boxShadow = arg.shadow.join(", ");
      }


      return arg.widget;
  }

  public function addStyleToInput(arg: {
    ?size: Size, 
    widget: js.html.InputElement, 
    ?color: Color,
    ?padding: Padding,
    ?margin: Margin,
    ?mainAxisAlignment: MainAxisAlignment,
    ?crossAxisAlignment: CrossAxisAlignment,
    ?border: Border,
    ?overflow: Overflow,
    ?shadow: Array<Shadow>
  }): js.html.Node {
    if(arg.size != null){
      arg.widget.style.minHeight = arg.size.getMinHeight();
      arg.widget.style.minWidth = arg.size.getMinWidth();
      arg.widget.style.height = arg.size.getHeight();
      arg.widget.style.width = arg.size.getWidth();
      arg.widget.style.maxHeight = arg.size.getMaxHeight();
      arg.widget.style.maxWidth = arg.size.getMaxWidth();
    }
    if(arg.color != null){
        arg.widget.style.backgroundColor = arg.color.getBackgroundColor();
        arg.widget.style.color = arg.color.getColor();
    }
    
    if(arg.padding != null){
        arg.widget.style.padding = arg.padding.getPadding();
    }
    
    if(arg.margin != null){
        arg.widget.style.margin = arg.margin != null ? arg.margin.getMargin() : Margin.all(0.0).getMargin();
    }

    if(arg.overflow != null) {
      switch (arg.overflow) {
        case Visible:
          arg.widget.style.overflow = "visible";
        case Hidden:
          arg.widget.style.overflow = "hidden";
        case Scroll:
          arg.widget.style.overflow = "scroll";
        case Auto:
          arg.widget.style.overflow = "auto";
        case Initial:
          arg.widget.style.overflow = "initial";
        case Inherit:
          arg.widget.style.overflow = "inherit";
      }
    }

    if(arg.border != null){
        switch (arg.border.getSides()){
            case Top:
                arg.widget.style.borderTop = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
            case Right:
                arg.widget.style.borderRight = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
            case Bottom:
                arg.widget.style.borderBottom = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
            case Left:
                arg.widget.style.borderLeft = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
            case All:
                arg.widget.style.border = arg.border.getWidth() + " " + arg.border.getStyle() + " " + arg.border.getColor();
            
        }
        arg.widget.style.borderRadius = arg.border.getCornerRadius();

    }
    
    
    
    if(arg.mainAxisAlignment != null) {
        switch (arg.mainAxisAlignment){
            case TopLeft:
                arg.widget.style.placeItems = "start start";
            case TopCenter:
                arg.widget.style.placeItems = "start center";
            case TopRight:
                arg.widget.style.placeItems = "start end";
            case Left:
                arg.widget.style.placeItems = "center start";
            case Center:
                arg.widget.style.placeItems = "center center";
            case Right:
                arg.widget.style.placeItems = "center end";
            case LowerLeft:
                arg.widget.style.placeItems = "end start";
            case LowerCenter:
                arg.widget.style.placeItems = "end center";
            case LowerRight:
                arg.widget.style.placeItems = "end end";
            case Stretch:
                arg.widget.style.placeItems = "stretch";
        }
    }

    if(arg.shadow != null && arg.shadow.length > 0) {
      arg.widget.style.boxShadow = arg.shadow.join(", ");
    }

    
    return arg.widget;
  }
}