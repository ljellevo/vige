package com.tests;

import com.externs.JSDom.JSDomSetup;
import utest.Assert;
import utest.Async;
import com.vige.components.Container;
import com.vige.components.Text;
import js.Browser;

class TestContainer extends utest.Test {
  var container: Container;

  public function setup() {
    // Add values to variable
    JSDomSetup.init();
    container = new Container({
      child: new Text("tekst"),
    });
  }



  function testRenderFunction() {
    var node = container.render();
    Assert.notNull(node);
    Assert.isTrue(node.hasChildNodes());
    Assert.equals(node.firstChild.nodeName.toLowerCase(), "p");
    Assert.isFalse(node.firstChild.hasChildNodes());
    Assert.equals(node.childNodes.length, 1);
  }


  public function teardown() {
    container = null;
  }
}