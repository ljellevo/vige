package com.vige.support;

class Fonts {
  var familyName: String;
  var genericFamily: String;

  public function new(
    familyName: String,
    genericFamily: String
  ) {
    this.familyName = familyName;
    this.genericFamily = genericFamily;
  }

  public function getFamilyName(): String {
    return familyName;
  }

  public function getGenericFamily(): String {
    return genericFamily;
  }
}