package com.tests;

import utest.Assert;
import utest.Async;

class TestContainer extends utest.Test {
  var field : String;
  var text: String;

  public function setup() {
    field = "some";
    text = "yo";
  }

  function specText() {
    text.length == 2;
  }

  //Normal tests should start with test*
  function testFieldIsSome() {
    Assert.equals("some", field);
  }

  //Each statement is testet as a bool
  function specField() {
    field.charAt(0) == 's';
    field.length > 3;
  }

  public function teardown() {
    field = null;
  }
}