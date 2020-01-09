package lib.components;

import lib.support.Widget;
import lib.components.Row;
import lib.components.Container;

/**
    Is documented
**/

class Constructors {



  public static function constructRows(arg: {data: Array<Dynamic>, elementsInEachRow: Int, elementBuilder: haxe.Constraints.Function, rowBuilder: haxe.Constraints.Function}): Array<Widget>{
    /*
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
  */
  /*
    if(arg.data == null) return [new Row({children: [new Container({})]})];
    if(arg.elementsInEachRow == 0) {
      return [];
    }
    var elementsInRow;
    if(arg.elementsInEachRow > arg.data.length) {
      elementsInRow = arg.data.length - 1;
    } else {
      elementsInRow = arg.elementsInEachRow - 1;
    }

    
    var rows = [];
    var row = [];
    for(i in 0...arg.data.length) {
      if(elementsInRow == 0) {
        row.push(arg.elementBuilder(i));
        rows.push(arg.rowBuilder(row));
        row = [];
      } else {
        if(i != 0 && i % elementsInRow == 0) {
          
          row.push(arg.elementBuilder(i));
          rows.push(arg.rowBuilder(row));
          row = [];
        }
        row.push(arg.elementBuilder(i));
      }
    }
    return rows;
  }
  */
  if(arg.data == null) return [new Row({children: [new Container({})]})];
    if(arg.elementsInEachRow == 0) {
      return [];
    }
    var rows = [];
    var row = [];
    for(i in 0...arg.data.length) {
      if(arg.elementsInEachRow == 1) {
        row.push(arg.elementBuilder(i));
        rows.push(arg.rowBuilder(row));
        row = [];
      } else {
        row.push(arg.elementBuilder(i));
        if(row.length % arg.elementsInEachRow == 0) {
          rows.push(arg.rowBuilder(row));
          row = [];
        }
      }
    }
    if(row.length > 0) {
      rows.push(arg.rowBuilder(row));
    }
    return rows;
  }

}