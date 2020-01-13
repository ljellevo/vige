module.exports = function(app) {
  const Database = require("./database");



  
  app.get('/maintenance/database/widgets/catalogue/:operation', function(req, res){
    var operation = req.params.operation;
    var database = new Database();
    if(operation == "insert") {
      database.query(function(client) {
        const collection = client.db("static").collection("catalogue");
        collection.insertMany([
          //Layout
          {
            "name": "Page",
            "shortDesc": "Root widget for pages", 
            //"desc": "A core component used to define a page for the website. \nEach page should consist of a Page component as root. This component is used to handle routing.",
            "desc": "A core widget used to define a unique page on the website. \nPage allows you to connect a view to a route, this gives you the ability to navigate to this page by adding the class to the Navigator in main. \nFor page to work it needs to overwrite the page variable contained in DynamicComponent.",
            "category": "layout",
            "arguments" : [
              {
                "name": "route",
                "req": true,
                "type": "String",
                "link": "",
                "note": "Used for navigating"
              },
              {
                "name": "title",
                "req": false,
                "type": "String",
                "link": "",
                "note": "Sets title in browser window/tab (missing)"
              },
              {
                "name": "navbar",
                "req": false,
                "type": "Widget",
                "link": "/widgets/components/navbar",
                "note": ""
              },
              {
                "name": "child",
                "req": false,
                "type": "Navbar",
                "link": "",
                "note": ""
              },
              {
                "name": "",
                "req": false,
                "type": "break",
                "link": "",
                "note": ""
              },
              {
                "name": "color",
                "req": false,
                "type": "Color",
                "link": "/widgets/customization/color",
                "note": ""
              },
              {
                "name": "border",
                "req": false,
                "type": "Border",
                "link": "/widgets/customization/border",
                "note": ""
              },
              {
                "name": "padding",
                "req": false,
                "type": "Padding",
                "link": "/widgets/customization/padding",
                "note": ""
              },
              {
                "name": "margin",
                "req": false,
                "type": "Margin",
                "link": "/widgets/customization/margin",
                "note": ""
              },
              {
                "name": "size",
                "req": false,
                "type": "Size",
                "link": "/widgets/customization/size",
                "note": ""
              },
            ],
            "returns": "A root object with a child.",
            "example": [
              {
              "desc": "How to create a new page with a given route:",
              "code": "/Link to github gist"
              }
            ],
            "order": 0
          },
          {
            "name": "Container",
            "shortDesc": "A simple container", 
            "desc": "A container with children. Container is equivalent with a <div> html tag.",
            "category": "layout",
            "arguments" : [
              {
                "name": "child",
                "req": false,
                "type": "Widget",
                "link": "",
                "note": ""
              },
              {
                "name": "color",
                "req": false,
                "type": "Color",
                "link": "/widgets/customization/color",
                "note": ""
              },
              {
                "name": "border",
                "req": false,
                "type": "Border",
                "link": "/widgets/customization/border",
                "note": ""
              },
              {
                "name": "padding",
                "req": false,
                "type": "Padding",
                "link": "/widgets/customization/padding",
                "note": ""
              },
              {
                "name": "margin",
                "req": false,
                "type": "Margin",
                "link": "/widgets/customization/margin",
                "note": ""
              },
              {
                "name": "size",
                "req": false,
                "type": "Size",
                "link": "/widgets/customization/size",
                "note": ""
              },
            ],
            "returns": "Container object with nested children.",
            "example": [
              {
              "desc": "Creates a container with a button.",
              "code": "/Link to github gist"
              }
            ]
            ,
            "order": 1
          },
          {
            "name": "Column",
            "shortDesc": "Structures children vertically", 
            "desc": "A vertical layout format where child widgets are layed out under each other. This widget compiles to a HTML <div> tag, with CSS Grid property.",
            "category": "layout",
            "arguments" : [
              {
                "name": "children",
                "req": true,
                "type": "Array<Widget>",
                "link": "",
                "note": "A collection of widgets, first child is positioned on top"
              },
              {
                "name": "cellColor",
                "req": false,
                "type": "Color",
                "link": "/widgets/customization/color",
                "note": "Color of cells (Not in use)"
              },
              {
                "name": "cellSize",
                "req": false,
                "type": "Size",
                "link": "/widgets/customization/size",
                "note": "Size of cell (Not in use)"
              },
              {
                "name": "color",
                "req": false,
                "type": "Color",
                "link": "/widgets/customization/color",
                "note": ""
              },
              {
                "name": "border",
                "req": false,
                "type": "Border",
                "link": "/widgets/customization/border",
                "note": ""
              },
              {
                "name": "padding",
                "req": false,
                "type": "Padding",
                "link": "/widgets/customization/padding",
                "note": ""
              },
              {
                "name": "margin",
                "req": false,
                "type": "Margin",
                "link": "/widgets/customization/margin",
                "note": ""
              },
              {
                "name": "size",
                "req": false,
                "type": "Size",
                "link": "/widgets/customization/size",
                "note": ""
              },
            ],
            "returns": "Container object with nested children.",
            "example": [
              {
              "desc": "Lays out two text elements and a button in a vertical layout.",
              "code": "/Link to github gist"
              }
            ],
            "order": 2
          },
          {
            "name": "Row",
            "shortDesc": "Structures children horizontally", 
            "desc": "A horizontal layout format where child widgets are layed out next to each other. This widget compiles to a HTML <div> tag, with CSS Grid property.",
            "category": "layout",
            "arguments" : [
              {
                "name": "children",
                "req": true,
                "type": "Array<Widget>",
                "link": "",
                "note": "A collection of widgets, first child is positioned on top"
              },
              {
                "name": "cellColor",
                "req": false,
                "type": "Color",
                "link": "/widgets/customization/color",
                "note": "Color of cells"
              },
              {
                "name": "cellSize",
                "req": false,
                "type": "Size",
                "link": "/widgets/customization/size",
                "note": "Size of cell"
              },
              {
                "name": "cellPadding",
                "req": false,
                "type": "Padding",
                "link": "/widgets/customization/padding",
                "note": "Size of cell"
              },
              {
                "name": "alignment",
                "req": false,
                "type": "RowAlignment",
                "link": "",
                "note": "How child is positioned in cell. Defaults to center, needs link, enum missing"
              },
              {
                "name": "color",
                "req": false,
                "type": "Color",
                "link": "/widgets/customization/color",
                "note": ""
              },
              {
                "name": "border",
                "req": false,
                "type": "Border",
                "link": "/widgets/customization/border",
                "note": ""
              },
              {
                "name": "padding",
                "req": false,
                "type": "Padding",
                "link": "/widgets/customization/padding",
                "note": ""
              },
              {
                "name": "margin",
                "req": false,
                "type": "Margin",
                "link": "/widgets/customization/margin",
                "note": ""
              },
              {
                "name": "size",
                "req": false,
                "type": "Size",
                "link": "/widgets/customization/size",
                "note": ""
              },
            ],
            "returns": "Container object with nested children.",
            "example": [
              {
              "desc": "Lays out two text elements and a button in a horizontal layout.",
              "code": "/Link to github gist"
              }
            ],
            "order": 3
          },
          {
            "name": "Centered",
            "shortDesc": "Centers child", 
            "desc": "Centers child either horizontally, vertically or both in parent",
            "category": "layout",
            "arguments" : [
              {
                "name": "child",
                "req": true,
                "type": "Widget",
                "link": "",
                "note": ""
              },
              {
                "name": "alignment",
                "req": true,
                "type": "CenterAlignment",
                "link": "",
                "note": "Determines which direction to center, Needs link, enum CenterAlignment"
              },
              {
                "name": "color",
                "req": false,
                "type": "Color",
                "link": "/widgets/customization/color",
                "note": ""
              },
              {
                "name": "border",
                "req": false,
                "type": "Border",
                "link": "/widgets/customization/border",
                "note": ""
              },
              {
                "name": "padding",
                "req": false,
                "type": "Padding",
                "link": "/widgets/customization/padding",
                "note": ""
              },
              {
                "name": "margin",
                "req": false,
                "type": "Margin",
                "link": "/widgets/customization/margin",
                "note": ""
              },
              {
                "name": "size",
                "req": false,
                "type": "Size",
                "link": "/widgets/customization/size",
                "note": ""
              },
            ],
            "returns": "Container with centered child",
            "example": [
              {
              "desc": "Examplecode desc",
              "code": "/Link to github gist"
              }
            ],
            "order": 4
          },
          {
            "name": "Positioned",
            "shortDesc": "Positiones a child", 
            "desc": "Positiones a child within the browser window, independent from parent. \n\nNeeds both a top/bottom and a left/right",
            "category": "layout",
            "arguments" : [
              {
                "name": "child",
                "req": true,
                "type": "Widget",
                "link": "",
                "note": ""
              },
              {
                "name": "top",
                "req": false,
                "type": "Float",
                "link": "",
                "note": ""
              },
              {
                "name": "right",
                "req": false,
                "type": "Float",
                "link": "",
                "note": ""
              },
              {
                "name": "bottom",
                "req": false,
                "type": "Float",
                "link": "",
                "note": ""
              },
              {
                "name": "left",
                "req": false,
                "type": "Float",
                "link": "",
                "note": ""
              },
              {
                "name": "color",
                "req": false,
                "type": "Color",
                "link": "/widgets/customization/color",
                "note": ""
              },
              {
                "name": "border",
                "req": false,
                "type": "Border",
                "link": "/widgets/customization/border",
                "note": ""
              },
              {
                "name": "padding",
                "req": false,
                "type": "Padding",
                "link": "/widgets/customization/padding",
                "note": ""
              },
              {
                "name": "margin",
                "req": false,
                "type": "Margin",
                "link": "/widgets/customization/margin",
                "note": ""
              },
              {
                "name": "size",
                "req": false,
                "type": "Size",
                "link": "/widgets/customization/size",
                "note": ""
              },
            ],
            "returns": "Positioned object with nested children",
            "example": [
              {
              "desc": "Creates a positioned container with children.",
              "code": "/Link to github gist"
              }
            ],
            "order": 5
          },
          
          //Functionality
          {
            "name": "Text",
            "shortDesc": "Add text", 
            "desc": "Text component is used to present text. Uses <p> as root HTML tag and adds customization.",
            "category": "functionality",
            "arguments" : [
              {
                "name": "text",
                "req": true,
                "type": "String",
                "link": "",
                "note": ""
              },
              {
                "name": "textFormat",
                "req": false,
                "type": "TextFormat",
                "link": "",
                "note": "Needs link, enum missing"
              },
              {
                "name": "textSize",
                "req": false,
                "type": "Int",
                "link": "",
                "note": ""
              },
              {
                "name": "font",
                "req": false,
                "type": "String",
                "link": "",
                "note": "Specify font family here to override application wide font"
              },
              {
                "name": "color",
                "req": false,
                "type": "Color",
                "link": "/widgets/customization/color",
                "note": ""
              },
              {
                "name": "border",
                "req": false,
                "type": "Border",
                "link": "/widgets/customization/border",
                "note": ""
              },
              {
                "name": "padding",
                "req": false,
                "type": "Padding",
                "link": "/widgets/customization/padding",
                "note": ""
              },
              {
                "name": "margin",
                "req": false,
                "type": "Margin",
                "link": "/widgets/customization/margin",
                "note": ""
              },
              {
                "name": "size",
                "req": false,
                "type": "Size",
                "link": "/widgets/customization/size",
                "note": ""
              },
            ],
            "returns": "Stylized text object.",
            "example": [
              {
              "desc": "How to create a text object",
              "code": "/Link to github gist"
              }
            ],
            "order": 0
          },
          {
            "name": "Button",
            "shortDesc": "Add button", 
            "desc": "A button is equivalent to a <button> html tag. This button requires an onClick action for event handling.",
            "category": "functionality",
            "arguments" : [
              {
                "name": "child",
                "req": true,
                "type": "Widget",
                "link": "",
                "note": ""
              },
              {
                "name": "onClick",
                "req": true,
                "type": "Callback",
                "link": "",
                "note": ""
              },
              {
                "name": "color",
                "req": false,
                "type": "Color",
                "link": "/widgets/customization/color",
                "note": ""
              },
              {
                "name": "border",
                "req": false,
                "type": "Border",
                "link": "/widgets/customization/border",
                "note": ""
              },
              {
                "name": "padding",
                "req": false,
                "type": "Padding",
                "link": "/widgets/customization/padding",
                "note": ""
              },
              {
                "name": "margin",
                "req": false,
                "type": "Margin",
                "link": "/widgets/customization/margin",
                "note": ""
              },
              {
                "name": "size",
                "req": false,
                "type": "Size",
                "link": "/widgets/customization/size",
                "note": ""
              },
            ],
            "returns": "A button widget with onClick callback",
            "example": [
              {
              "desc": "A button which displays an alert when clicked.",
              "code": "/Link to github gist"
              }
            ],
            "order": 1
          },

          //Customization
          {
            "name": "Color",
            "shortDesc": "Colorize widget", 
            "desc": "Colorize widget",
            "category": "customization",
            "arguments" : [
              {
                "name": "color",
                "req": false,
                "type": "Colors",
                "link": "/widgets/customization/colors",
                "note": ""
              },
              {
                "name": "backgroundColor",
                "req": false,
                "type": "Colors",
                "link": "/widgets/customization/colors",
                "note": ""
              },
            ],
            "returns": "",
            "example": [
              {
              "desc": "",
              "code": "/Link to github gist"
              }
            ],
            "order": 0
          },
          {
            "name": "Colors",
            "shortDesc": "Color object", 
            "desc": "Converts RGBA or HEX to a Colors object. This object is static.",
            "category": "customization",
            "arguments" : [
              {
                "name": "fromString(rgba: String);",
                "req": false,
                "type": "Static function",
                "link": "",
                "note": "Send in color in HEX format, returns Colors object"
              },
              {
                "name": "fromRGBAi(r: Int, g: Int, b: Int, a: Int);",
                "req": false,
                "type": "Static function",
                "link": "",
                "note": "Send in color in RGBAi format, returns Colors object"
              },
              {
                "name": "fromRGBAf(r: Float, g: Float, b: Float, a: Float);",
                "req": false,
                "type": "Static function",
                "link": "",
                "note": "Send in color in RGBAf format, returns Colors object"
              },
            ],
            "returns": "Object with color",
            "example": [
              {
              "desc": "Example code",
              "code": "/Link to github gist"
              }
            ],
            "order": 1
          },
          {
            "name": "Size",
            "shortDesc": "Adjust widget size", 
            "desc": "Used to set size of widget",
            "category": "customization",
            "arguments" : [
              {
                "name": "height",
                "req": false,
                "type": "Float",
                "link": "",
                "note": "Use null or Math.NEGATIVE_INFINITY to fill parent widget"
              },
              {
                "name": "heightType",
                "req": false,
                "type": "String",
                "link": "",
                "note": "Defaults to px"
              },
              {
                "name": "width",
                "req": false,
                "type": "Float",
                "link": "",
                "note": "Use null or Math.NEGATIVE_INFINITY to fill parent widget"
              },
              {
                "name": "widthType",
                "req": false,
                "type": "String",
                "link": "",
                "note": "Defaults to px"
              },
            ],
            "returns": "Object with size",
            "example": [
              {
              "desc": "Example code",
              "code": "/Link to github gist"
              }
            ],
            "order": 2
          },
          {
            "name": "Padding",
            "shortDesc": "Add padding to widget", 
            "desc": "Set padding of widget",
            "category": "customization",
            "arguments" : [
              {
                "name": "fromTRBL(top: Float, right: Float, bottom: Float, left: Float)",
                "req": false,
                "type": "Static function",
                "link": "",
                "note": "Send in padding for each side, returns Padding object"
              },
              {
                "name": "all(padding: Float)",
                "req": false,
                "type": "Static function",
                "link": "",
                "note": "Send in padding for all sides, returns Padding object"
              },
            ],
            "returns": "Object with padding",
            "example": [
              {
              "desc": "Example code",
              "code": "/Link to github gist"
              }
            ],
            "order": 3
          },
          {
            "name": "Margin",
            "shortDesc": "Add margin to widget", 
            "desc": "Set margin of widget",
            "category": "customization",
            "arguments" : [
              {
                "name": "fromTRBL(top: Float, right: Float, bottom: Float, left: Float)",
                "req": false,
                "type": "Static function",
                "link": "",
                "note": "Send in margin for each side, returns Margin object"
              },
              {
                "name": "all(padding: Float)",
                "req": false,
                "type": "Static function",
                "link": "",
                "note": "Send in margin for all sides, returns Margin object"
              },
            ],
            "returns": "Object with margin",
            "example": [
              {
              "desc": "Example code",
              "code": "/Link to github gist"
              }
            ],
            "order": 4
          },
          {
            "name": "Border",
            "shortDesc": "Set border on widget", 
            "desc": "Sets border on widget",
            "category": "customization",
            "arguments" : [
              {
                "name": "style",
                "req": true,
                "type": "BorderStyle",
                "link": "",
                "note": "Needs link, enum BorderStyle"
              },
              {
                "name": "width",
                "req": true,
                "type": "Int",
                "link": "",
                "note": "Sets width of border"
              },
              {
                "name": "color",
                "req": true,
                "type": "Colors",
                "link": "",
                "note": "Sets color of border"
              },
              {
                "name": "cornerRadius",
                "req": false,
                "type": "CornerRadius",
                "link": "",
                "note": "Needs Link"
              },
              {
                "name": "sides",
                "req": false,
                "type": "BorderSides",
                "link": "",
                "note": "Needs link, enum BorderSides"
              },
            ],
            "returns": "Object with border ",
            "example": [
              {
              "desc": "Example code",
              "code": "/Link to github gist"
              }
            ],
            "order": 5
          },

          //Components
          {
            "name": "Navbar",
            "shortDesc": "Add navbar to page", 
            "desc": "Add a navbar to page, this eases navigation on page",
            "category": "components",
            "arguments" : [
              {
                "name": "child",
                "req": true,
                "type": "Widget",
                "link": "",
                "note": ""
              },
              {
                "name": "height",
                "req": false,
                "type": "Int",
                "link": "",
                "note": "Height of navbar, remember to add negative margin to child of page to remove scrollbar"
              },
              {
                "name": "position",
                "req": false,
                "type": "NavbarPosition",
                "link": "",
                "note": "Needs link, enum NavbarPosition"
              },
              {
                "name": "sticky",
                "req": false,
                "type": "bool",
                "link": "",
                "note": "Make navbar stick to browser window"
              },
              {
                "name": "offset",
                "req": false,
                "type": "Int",
                "link": "",
                "note": "Add offset between bar and window edge"
              },
              {
                "name": "onComplete",
                "req": false,
                "type": "Callback",
                "link": "",
                "note": "Function that is called when navbar is rendered, used to update child of bar once URL is available"
              },
              {
                "name": "color",
                "req": false,
                "type": "Color",
                "link": "/widgets/customization/color",
                "note": ""
              },
              {
                "name": "border",
                "req": false,
                "type": "Border",
                "link": "/widgets/customization/border",
                "note": ""
              },
              {
                "name": "padding",
                "req": false,
                "type": "Padding",
                "link": "/widgets/customization/padding",
                "note": ""
              },
              {
                "name": "margin",
                "req": false,
                "type": "Margin",
                "link": "/widgets/customization/margin",
                "note": ""
              },
              {
                "name": "size",
                "req": false,
                "type": "Size",
                "link": "/widgets/customization/size",
                "note": ""
              },
            ],
            "returns": "",
            "example": [
              {
              "desc": "",
              "code": "/Link to github gist"
              }
            ],
            "order": 0
          },
          {
            "name": "Image",
            "shortDesc": "Add image to page", 
            "desc": "Image widget.",
            "category": "components",
            "arguments" : [
              {
                "name": "src",
                "req": true,
                "type": "String",
                "link": "",
                "note": "Path to image in asset folder."
              },
              {
                "name": "alt",
                "req": false,
                "type": "String",
                "link": "",
                "note": "Mouseover text for image"
              },
              {
                "name": "height",
                "req": false,
                "type": "Float",
                "link": "",
                "note": "Sets height of image as px"
              },
              {
                "name": "minHeight",
                "req": false,
                "type": "Float",
                "link": "",
                "note": "Minimum height for the image"
              },
              {
                "name": "width",
                "req": false,
                "type": "Float",
                "link": "",
                "note": "Sets width of image as px"
              },
              {
                "name": "minwidth",
                "req": false,
                "type": "Float",
                "link": "",
                "note": "Minimum width for the image"
              },
              {
                "name": "color",
                "req": false,
                "type": "Color",
                "link": "/widgets/customization/color",
                "note": ""
              },
              {
                "name": "border",
                "req": false,
                "type": "Border",
                "link": "/widgets/customization/border",
                "note": ""
              },
              {
                "name": "padding",
                "req": false,
                "type": "Padding",
                "link": "/widgets/customization/padding",
                "note": ""
              },
              {
                "name": "margin",
                "req": false,
                "type": "Margin",
                "link": "/widgets/customization/margin",
                "note": ""
              },
              {
                "name": "size",
                "req": false,
                "type": "Size",
                "link": "/widgets/customization/size",
                "note": ""
              },
            ],
            "returns": "Image widget",
            "example": [
              {
              "desc": "Example code",
              "code": "/Link to github gist"
              }
            ],
            "order": 1
          },
          {
            "name": "Collection",
            "shortDesc": "Build a component", 
            "desc": "Build a component based on data",
            "category": "components",
            "arguments" : [
              {
                "name": "count",
                "req": true,
                "type": "Int",
                "link": "",
                "note": "Amount of iterations the builder will perform"
              },
              {
                "name": "color",
                "req": false,
                "type": "Color",
                "link": "/widgets/customization/color",
                "note": ""
              },
              {
                "name": "border",
                "req": false,
                "type": "Border",
                "link": "/widgets/customization/border",
                "note": ""
              },
              {
                "name": "padding",
                "req": false,
                "type": "Padding",
                "link": "/widgets/customization/padding",
                "note": ""
              },
              {
                "name": "margin",
                "req": false,
                "type": "Margin",
                "link": "/widgets/customization/margin",
                "note": ""
              },
              {
                "name": "size",
                "req": false,
                "type": "Size",
                "link": "/widgets/customization/size",
                "note": ""
              },
            ],
            "returns": "An object where the .build(function(iterator){}) is used to return widgets",
            "example": [
              {
              "desc": "Example Code",
              "code": "/Link to github gist"
              }
            ],
            "order": 2
          },

          //Network
          {
            "name": "Stream",
            "shortDesc": "Connect to a datastream", 
            "desc": "Connect to a datastream, when a message is recieved the child is re-rendered",
            "category": "network",
            "arguments" : [
              {
                "name": "url",
                "req": true,
                "type": "String",
                "link": "",
                "note": ""
              },
              {
                "name": "onStandby",
                "req": true,
                "type": "Callback",
                "link": "",
                "note": ""
              },
              {
                "name": "onOpen",
                "req": true,
                "type": "Callback(Event)",
                "link": "",
                "note": ""
              },
              {
                "name": "onMessage",
                "req": true,
                "type": "Callback(MessageEvent)",
                "link": "",
                "note": ""
              },
              {
                "name": "onClose",
                "req": true,
                "type": "Callback(CloseEvent)",
                "link": "",
                "note": ""
              },
              {
                "name": "onError",
                "req": false,
                "type": "Callback(ErrorEvent)",
                "link": "",
                "note": ""
              },
            ],
            "returns": "Stream widget",
            "example": [
              {
              "desc": "Example Code",
              "code": "/Link to github gist"
              }
            ],
            "order": 0
          },
          {
            "name": "Request",
            "shortDesc": "Send a single request", 
            "desc": "Send a single request to a server. Upon result child is updated",
            "category": "network",
            "arguments" : [
              {
                "name": "url",
                "req": true,
                "type": "String",
                "link": "",
                "note": ""
              },
              {
                "name": "method",
                "req": false,
                "type": "String",
                "link": "",
                "note": "If the request is a GET, POST, PUT or DELETE. Defaults to GET"
              },
              {
                "name": "onComplete",
                "req": true,
                "type": "Callback(HttpResponse)",
                "link": "",
                "note": ""
              },
              {
                "name": "onProgress",
                "req": true,
                "type": "Callback",
                "link": "",
                "note": ""
              },
              {
                "name": "onError",
                "req": true,
                "type": "Callback(HttpResponse)",
                "link": "",
                "note": ""
              },
            ],
            "returns": "A request widget",
            "example": [
              {
              "desc": "Example code",
              "code": "/Link to github gist"
              }
            ],
            "order": 1
          },
          {
            "name": "SingleRequest",
            "shortDesc": "Send a single http request", 
            "desc": "Sends a single http request.",
            "category": "network",
            "arguments" : [
              {
                "name": "url",
                "req": true,
                "type": "String",
                "link": "",
                "note": ""
              },
              {
                "name": "method",
                "req": false,
                "type": "String",
                "link": "",
                "note": "If the request is a GET, POST, PUT or DELETE. Defaults to GET"
              },
              {
                "name": "onComplete",
                "req": true,
                "type": "Callback(HttpResponse)",
                "link": "",
                "note": ""
              },
              {
                "name": "onProgress",
                "req": true,
                "type": "Callback",
                "link": "",
                "note": ""
              },
              {
                "name": "onError",
                "req": true,
                "type": "Callback(HttpResponse)",
                "link": "",
                "note": ""
              },
            ],
            "returns": "Returns a SingleRequest object, call .request() on this object to send the request",
            "example": [
              {
              "desc": "Example Code",
              "code": "/Link to github gist"
              }
            ],
            "order": 2
          },
          
          //Utilities
          {
            "name": "Constructors",
            "shortDesc": "Construct grids", 
            "desc": "Used to construct different grids",
            "category": "utilities",
            "arguments" : [
              {
                "name": "constructRows({\ndata: Array<Dynamic>, \nelementInEachRow: Int, \nelementBuilder: Callback(iterator), \nrowBuilder: Callback(row)\n})",
                "req": true,
                "type": "Static function",
                "link": "",
                "note": "Creates a constructor"
              },
            ],
            "returns": "An array of rows, where each row contains an array of elements",
            "example": [
              {
              "desc": "Example Code",
              "code": "/Link to github gist"
              }
            ],
            "order": 0
          },
        ])
        res.send("Catalogue was " + operation + "ed");
      });
    } else if(operation == "delete") {
      database.query(function(client) {
        const collection = client.db("static").collection("catalogue");
        collection.deleteMany({})
        res.send("Catalogue was " + operation + "d");
      });
    }
  });

  app.get('/maintenance/database/widgets/categories/:operation', function(req, res){
    var operation = req.params.operation;
    var database = new Database();
    if(operation == "insert") {
      database.query(function(client) {
        const collection = client.db("static").collection("categories");
        collection.insertMany([
          {"title": "Layout", "desc": "Widgets that is used to structure the layout of the website", "order": 0},
          {"title": "Functionality", "desc": "Widgets that provide functionality to the website", "order": 1},
          {"title": "Customization", "desc": "Components used to customize widgets", "order": 2},
          {"title": "Components", "desc": "More spesific and complete components that is used for clearly defined usecases", "order": 3},
          {"title": "Network", "desc": "Utilities for communicating with a server/api", "order": 4},
          {"title": "Utilities", "desc": "Technical tools to help utilize the features provided by the browser", "order": 5},
        ]);
        res.send("Categories was " + operation + "ed");
      });
    } else if(operation == "delete") {
      database.query(function(client) {
        const collection = client.db("static").collection("categories");
        collection.deleteMany({})
        res.send("Categories was " + operation + "d");
      });
    }
  });

  app.get('/maintenance/database/guides/:operation', function(req, res){
    var operation = req.params.operation;
    var database = new Database();
    if(operation == "insert") {
      database.query(function(client) {
        const collection = client.db("static").collection("quick-start-guides");
        collection.insertMany([
          {
            "title": "Creating a new project", 
            "desc": "Simple guide to show how to create a project",
            "steps": [
              {
                "type": "text",
                "format": "paragraph",
                "title": "",
                "content": "This guide will take you through how to create a project."
              },
              {
                "type": "break",
                "format": "",
                "title": "",
                "content": "50"
              },
              {
                "type": "text",
                "format": "header",
                "title": "",
                "content": "Downloading MIST.IO"
              },
              {
                "type": "text",
                "format": "paragraph",
                "title": "",
                "content": "First step is to download MIST.IO. This can be done in multiple ways. \nIt's recomended to download the CLI, through the CLI all necessary components will be installed. "
              },
              {
                "type": "button",
                "format": "link",
                "title": "Download CLI",
                "content": "/download"
              },
              {
                "type": "text",
                "format": "paragraph",
                "title": "",
                "content": "If you don't want the CLI you can downlaod the library directly through haxelib"
              },
              {
                "type": "text",
                "format": "code",
                "title": "",
                "content": " - haxelib install mist"
              },
              {
                "type": "text",
                "format": "paragraph",
                "title": "",
                "content": "It's also possible to download the sourcecode from GitHub"
              },
              {
                "type": "button",
                "format": "link/external",
                "title": "Click here to download MIST.IO",
                "content": "https://github.com/ljellevo/mist.io"
              },
            ], 
          },
          {
            "title": "Creating a simple page", 
            "desc": "How to create a simple page",
            "steps": [
              {
                "type": "text",
                "format": "paragraph",
                "title": "",
                "content": "This is how to create a simple page"
              },
              {
                "type": "text",
                "format": "header",
                "title": "",
                "content": "Create a dynamic component"
              },
              {
                "type": "button",
                "format": "link",
                "title": "Click me to go to home page",
                "content": "/"
              },
            ], 
          },
        ]);
        res.send("Categories was " + operation + "ed");
      });
    } else if(operation == "delete") {
      database.query(function(client) {
        const collection = client.db("static").collection("quick-start-guides");
        collection.deleteMany({})
        res.send("Categories was " + operation + "d");
      });
    }
  });

  app.get('/test', function(req, res){
    res.send("Single response");
  });

}