package com.vige.components;

import js.lib.Float32Array;
import com.vige.core.*;
import com.vige.support.*;
import com.vige.utils.*;
import com.vige.support.Enums;
import js.Browser;
import js.html.Window;
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

class Canvas implements Widget {
    var canvas: js.html.CanvasElement;
    public var color: Color;
    public var border: Border;
    public var padding: Padding;
    public var margin: Margin;
    public var size: Size;
    public var overflow: Overflow;
    public var shadow: Array<Shadow>;

    public function new(arg: {
        ?color: Color,
        ?border: Border,
        ?padding: Padding,
        ?margin: Margin,
        ?size: Size, 
        ?overflow: Overflow,
        ?shadow: Array<Shadow>
    }) {
        this.color = arg.color;
        this.border = arg.border;
        this.padding = arg.padding;
        this.margin = arg.margin;
        this.size = arg.size != null ? arg.size : new Size({height: "100%", width: "100%"});
        this.overflow = arg.overflow;
        this.shadow = arg.shadow;
    }

    public function init(){}
    
    public function draw(a: haxe.Constraints.Function): Widget{
      //js.html.webgl.RenderingContext
      canvas = Browser.document.createCanvasElement();
      var gl = canvas.getContext("webgl");
      var vertices = [
        -0.7,-0.1,0,
        -0.3,0.6,0,
        -0.3,-0.3,0,
        0.2,0.6,0,
        0.3,-0.3,0,
        0.7,0.6,0 
     ];

     // Create an empty buffer object
     var vertex_buffer = gl.createBuffer();

     // Bind appropriate array buffer to it
     gl.bindBuffer(gl.ARRAY_BUFFER, vertex_buffer);
  
     // Pass the vertex data to the buffer
     gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(vertices), gl.STATIC_DRAW);

     // Unbind the buffer
     gl.bindBuffer(gl.ARRAY_BUFFER, null);

      var vertCode =
            'attribute vec3 coordinates;' +
            'void main(void) {' +
               ' gl_Position = vec4(coordinates, 1.0);' +
            '}';

      // Create a vertex shader object
      var vertShader = gl.createShader(gl.VERTEX_SHADER);

      // Attach vertex shader source code
      gl.shaderSource(vertShader, vertCode);

      // Compile the vertex shader
      gl.compileShader(vertShader);

      // Fragment shader source code
      var fragCode =
        'void main(void) {' +
            'gl_FragColor = vec4(0.0, 0.0, 0.0, 0.1);' +
        '}';

      // Create fragment shader object
      var fragShader = gl.createShader(gl.FRAGMENT_SHADER);

      // Attach fragment shader source code
      gl.shaderSource(fragShader, fragCode);

      // Compile the fragmentt shader
      gl.compileShader(fragShader);

      // Create a shader program object to store
      // the combined shader program
      var shaderProgram = gl.createProgram();

      // Attach a vertex shader
      gl.attachShader(shaderProgram, vertShader);

      // Attach a fragment shader
      gl.attachShader(shaderProgram, fragShader);

      // Link both the programs
      gl.linkProgram(shaderProgram);

      // Use the combined shader program object
      gl.useProgram(shaderProgram);

      // Bind vertex buffer object
      gl.bindBuffer(gl.ARRAY_BUFFER, vertex_buffer);

      // Get the attribute location
      var coord = gl.getAttribLocation(shaderProgram, "coordinates");

      // Point an attribute to the currently bound VBO
      gl.vertexAttribPointer(coord, 3, gl.FLOAT, false, 0, 0);

      // Enable the attribute
      gl.enableVertexAttribArray(coord);


      new StyleManager().addStyleToCanvas({widget: canvas, color: color, border: border, padding: padding, margin: margin, size: size, overflow: overflow, shadow: shadow}); 
      a(gl, canvas);
      return this;
    }

    
    
    public function render():js.html.Node {
        //var container = Browser.document.createDivElement();

               
        return canvas;
    }
}