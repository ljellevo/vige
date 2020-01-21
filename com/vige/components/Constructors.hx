package com.vige.components;

import com.vige.core.*;
import com.vige.support.*;
import com.vige.utils.*;

/*
import lib.support.Widget;
import lib.components.Row;
import lib.components.Container;
*/

/**
    Is documented
**/

class Constructors {



  public static function constructRows(arg: {data: Array<Dynamic>, elementsInEachRow: Int, elementBuilder: haxe.Constraints.Function, rowBuilder: haxe.Constraints.Function}): Array<Widget>{
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


  public static function constructColumns(arg: {data: Array<Dynamic>, elementsInEachColumn: Int, elementBuilder: haxe.Constraints.Function, columnBuilder: haxe.Constraints.Function}): Array<Widget>{
    if(arg.data == null) return [new Row({children: [new Container({})]})];
      if(arg.elementsInEachColumn == 0) {
        return [];
      }
      var columns = [];
      var column = [];
      for(i in 0...arg.data.length) {
        if(arg.elementsInEachColumn == 1) {
          column.push(arg.elementBuilder(i));
          columns.push(arg.columnBuilder(column));
          column = [];
        } else {
          column.push(arg.elementBuilder(i));
          if(column.length % arg.elementsInEachColumn == 0) {
            columns.push(arg.columnBuilder(column));
            column = [];
          }
        }
      }
      if(column.length > 0) {
        columns.push(arg.columnBuilder(column));
      }
      return columns;
    }

}