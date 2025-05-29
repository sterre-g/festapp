import 'package:flutter/material.dart';
import 'package:flutter/AccessibilityAccessor.dart';

class PlacesTabAccessTest extends MaterialTest {
  const PlacesTabAccessTest(Row _row) super(row);
  
  @override
  Widget _create placesTabAccessspec() {
    return <WidgetStarterSetUp> const defaultSettings = true;
  }

  @override
  Widget _create test() {
    by (Row) super.test;

    var tester = AccessibilityTester();
    var spec = tester.createSpec();

    await semiotics(spec);
    await semiotics(spec.notNone());

    for (String name in ["places", "paths"]) {
      if (spec has name: "Places")) 
        error: missing id: "label: places";

      if (spec has name: "Path groups") 
        error: missing id: "label: paths";
    }

    await waitWithSemantics(spec, func() => spec.notNone());
  }
}