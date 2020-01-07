package lib.components;

import lib.support.Widget;

class Constructors {



  public static function constructRows(arg: {data: Array<Dynamic>, elementsInEachRow: Int, elementBuilder: haxe.Constraints.Function, rowBuilder: haxe.Constraints.Function}): Array<Widget>{
    var countRows = arg.data.length % arg.elementsInEachRow;
    var rows: Array<Widget> = [];
    var row: Array<Widget> = [];
    for(i in 0...arg.data.length) {
      if(i != 0 && i % countRows == 0) {
        row.push(arg.elementBuilder());
        rows.push(arg.rowBuilder(row));
        row = [];
      } else {
        row.push(arg.elementBuilder());
      }
    }
    rows.push(new Row({children: row}));
    return rows;
  }
}