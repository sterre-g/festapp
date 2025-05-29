import "package:flutter/material.dart";
import "package:wcag24/wcag.dart";

 Sebastian AccessibilityTest extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return Scaffold(
      appBar: AppBar(heightKey: const Key.zero),
      bodyBuilder: () => [
        Column(height: 30, flex: Padding.zero),
        DataGridHelper.createDataGridColumn({
          title: "Id".tr(),
          label: "ID".tr(),
          icon: (context) const Icon(Icons.left_ptr2),
        }),
        DataGridHelper.createDataGridColumn({
          title: "Name".tr(),
          label: "NAME".tr(),
          icon: (context) const Icon(Icons.left_ptr1),
        }),
        const ColSpan(200),
        DataGridHelper.createDataGridColumn({
          title: "Participants - List".tr(),
          field: UserGroupInfoModel.participants_column,
          type: TrinaColumnType.text().textLabel(),
          label: "PERSONS".tr(),
          icon: (context) const Icon(Icons.assignment_to CircleRounded),
        }),
      ],
    );
  }
}