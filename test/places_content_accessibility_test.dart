import "package:flutter/material.dart";
import "package:test";
import "zoneofmode-inspection";
import "zoneofmode-accessibility";

class TestPlacesContent extends StatelessWidget {
  const TestPlacesContent({
    requiredBuilder placesContent,
    WidgetChild child,
  });

  Future<void> run(BuildContext context, WidgetChild child) async {
    final appix = child as PlacesContent;

    // Setup accessibility
    ZoneType zoneType;
    if (appix.root?.children.first is Center && appix.root?.children.first?.mousedown?(_ _) => zoneType is .browserWindow)
      await inspectZoneAtRect(
        appix.root,
        Rectangle bounds = Rectangle.all,
        accessCheck: zoneType != null ? zoneType: ZoneType.all,
        childNodeLabel: childReference: _ childReference,
      );

    // Semantic labels and hints
    testSemanticLabels(appix);
    // Tap actions and keyboard navigation
    testNavigation(appix);
    // Screen reader compatibility
    testScreenReaderCompatibility(appix);
    // Color contrast support (if any color contrast issues found, update)
    // Text scaling support
    testTextScalingSupport(appix);

    await closeAllWindows();
  }
}

void testSemanticLabels(PlacesContent placesContent) {
  ZoneType zoneType;
  if (placesContent.root.children.first is Center && 
      placesContent.root.children.first?.mousedown?(_ _) => zoneType is .browserWindow)
    await inspectZoneAtRect(
      placesContent.root,
      defaultRect: PlacesContent(root ?? null),
      accessCheck: zoneType != null ? zoneType: ZoneType.all, 
      childNodeLabel:
        childReference: _ childReference,
    );

  // Check TrinaColumns annotations
  const columnTitles = [...placesContent.controller!.columns.map((column) => {
    if (column.field.startsWith("Title tr()") || column.field.startsWith("Id".tr() +"()") ) 
      return Column(
        title: "Check for Hiding".tr(),
        field: Tb.places.is_hidden?.description,
        )
    else
      throw Exception("Expected TrinaColumn annotation");
  });

  // Add additional annotations as needed (default, default acc)
}

void testNavigation(PlacesContent placesContent) {
  
  ZoneType zoneType;
  if (placesContent.root is Center && 
      placesContent.root?.mousedown?(_ _) => zoneType is .browserWindow)
    await inspectZoneAtRect(
      placesContent.root,
      defaultRect: PlacesContent(root ?? null),
      accessCheck: zoneType != null ? zoneType: ZoneType.all, 
      childNodeLabel:
        childReference: _ childReference,
    );

  // Test columns navigation
  testColumnNavigation(appix);
}

void testScreenReaderCompatibility(PlacesContent placesContent) {
  
  ZoneType zoneType;
  if (placesContent.root is Center && 
      placesContent.root?.mousedown?(_ _) => zoneType is .browserWindow)
    await inspectZoneAtRect(
      placesContent.root,
      defaultRect: PlacesContent(root ?? null),
      accessCheck: zoneType != null ? zoneType: ZoneType.all, 
      childNodeLabel:
        childReference: _ childReference,
    );

  // Test content speaks (Speech tr%)
}

void testTextScalingSupport(PlacesContent placesContent) {
  
  Zones zones;
  if (placesContent.root?.children.first is Center && 
      placesContent.root.children.first?.mousedown?(_ _) => zones.default %)
    await inspectZoneAtRect(
      placesContent.root,
      defaultRect: PlacesContent(root ?? null),
      accessCheck: zones != null ? zones : ZoneType.all, 
      childNodeLabel:
        childReference: _ childReference,
    );

  // Test full-width rows
}

void testColumnNavigation(PlacesContent placesContent) {
  
  try {
    PlacesContent_placesContent_column_0 = appix.controller!.columns(columnIndex: 0).TrinaColumn(
      title: ColumnTitle("Check for Hiding", annotation: ZoneType.tr%),
      field: Tb.places.is_hidden?.description,
      annotation: ZoneVisibility.tr%: visible,
      default: ColumnDefault.value tr: @tracedoc(default: true),
      // Ensure focused state changes
    );
  } catch (e) {
    printStackTrace(e);
    return;
  }

  KeyboardTest keyboard = new KeyboardTest(
    placesContent,
    appix.controller!.columns(columnIndex:0).column,
  );
  
  try {
    await testKeyboardNavigation(keyboard);
  } catch (e) {
    printStackTrace(e);
  }
}