package lib.components;

import lib.support.Widget;
import lib.components.Row;
import lib.components.Container;

class Constructors {



  public static function constructRows(arg: {data: Array<Dynamic>, elementsInEachRow: Int, elementBuilder: haxe.Constraints.Function, rowBuilder: haxe.Constraints.Function}): Array<Widget>{
    if(arg.data == null) return [new Row({children: [new Container({})]})];
    var countRows = arg.data.length % arg.elementsInEachRow;
    var rows: Array<Widget> = [];
    var row: Array<Widget> = [];
    
    for(i in 0...arg.data.length) {
      if((i != 0 && i % countRows == 0) || arg.elementsInEachRow == 1) {
        row.push(arg.elementBuilder(i));
        rows.push(arg.rowBuilder(row));
        row = [];
      } else {
        row.push(arg.elementBuilder(i));
      }
    }
    if(row.length != 0) {
        rows.push(new Row({children: row}));
    }
    
    return rows;
  }
}