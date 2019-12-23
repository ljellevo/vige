class HelloPage extends DynamicComponent {
  var counter = 0;
  public function new() {}

  override public function component() : Widget {
    page = new Page({
      route: "/functionality",
      child: new Column({
        size: new Size({height: 100, heightType: "%", width: 100, widthType: "%"}),
        children: [
          new Row({
            size: new Size({height: 100, heightType: "%"}),
            children: [
              new Text("Button has been clicked " + counter + " times"),
              new Button({
                text: "Click me:",
                onClick: function (e) {
                  setState(this, function(e){
                      counter++;
                  });
                }
              }),
              new Button({
                text: "Navigate",
                onClick: function (e) {
                  Navigate.to({route: "/", param: [
                    {param: "counter", data: counter}
                  ]}); 
                }
              })
            ]
          })
        ]
      })
    });
    return page;
  }
}






