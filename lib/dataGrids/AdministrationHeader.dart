import 'package:avapp/dataGrids/DataGridAction.dart';
import 'package:avapp/dataGrids/DataGridHelper.dart';
import 'package:avapp/dataGrids/SingleTableDataGrid.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'PlutoAbstract.dart';
import '../services/DialogHelper.dart';
import '../services/ToastHelper.dart';

class AdministrationHeader<T extends IPlutoRowModel> extends StatefulWidget {
  final PlutoGridStateManager stateManager;
  final SingleTableDataGrid dataGrid;
  final List<DataGridAction>? headerChildren;
  final DataGridExtendedAction? saveExtended;

  const AdministrationHeader({required this.stateManager, Key? key, required this.fromPlutoJson, required this.loadData, this.headerChildren, this.saveExtended, required this.dataGrid}) : super(key: key);

  final T Function(Map<String, dynamic>) fromPlutoJson;
  final Future<void> Function() loadData;
  @override
  _AdministrationHeaderState createState() => _AdministrationHeaderState(fromPlutoJson, loadData, dataGrid, headerChildren: headerChildren, saveExtended: saveExtended);

  static PlutoGridConfiguration defaultPlutoGridConfiguration(String langCode) {
    return PlutoGridConfiguration(
      localeText: DataGridHelper.getPlutoLocaleFromLangCode(langCode),
      style: PlutoGridStyleConfig(
        rowHeight: 36,
        cellColorInReadOnlyState: Colors.white70
      ),
    );
  }
}

class _AdministrationHeaderState<T extends IPlutoRowModel> extends State<AdministrationHeader>{

  final T Function(Map<String, dynamic>) fromPlutoJson;
  final Future<void> Function() loadData;
  final SingleTableDataGrid dataGrid;
  List<DataGridAction>? headerChildren = [];
  final DataGridExtendedAction? saveExtended;
  List<Widget> allChildren = [];

  _AdministrationHeaderState(this.fromPlutoJson, this.loadData, this.dataGrid, {this.headerChildren, this.saveExtended});

  @override
  Widget build(BuildContext context) {
    allChildren.clear();
    headerChildren = headerChildren ?? [];
    for(var a in headerChildren!)
    {
      allChildren.add(ElevatedButton(onPressed: (){a.action(dataGrid);}, child: Text(a.name)));
    }
    if(headerChildren!.isNotEmpty)
    {
      allChildren.insertAll(0, [const VerticalDivider()]);
    }
    allChildren.insertAll(0, [
      ElevatedButton(
      onPressed: _addRow,
      child: const Text("Add").tr(),
    ),
      ElevatedButton(
        onPressed: _cancelChanges,
        child: const Text("Discard changes").tr(),
      ),
      saveExtended==null?
        ElevatedButton(
          onPressed: _saveChanges,
          child: const Text("Save changes").tr(),
        ):
        ElevatedButton(
          onPressed: (){
            saveExtended!.action==null ? _saveChanges() :
            saveExtended!.action!(dataGrid, _saveChanges);
            },
          child: Text(saveExtended!.name??"Save changes".tr()),
        )
      ,]);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: Wrap(
            spacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: allChildren
        ),
      ),
    );
  }

  void _addRow(){
    var newRow = widget.stateManager.getNewRows();
    widget.stateManager.prependRows(newRow);
    for (var value in newRow) {
      dataGrid.newRows.add(value);
    }
  }

  Future<void> _saveChanges() async{
    var toDelete = dataGrid.deletedRows.toList();
    dataGrid.updatedRows.removeAll(toDelete);
    var deleteList = List<T>.from(
        toDelete.map((x) => fromPlutoJson(x.toJson())));
    if(deleteList.isNotEmpty)
    {
      var result = await DialogHelper.showConfirmationDialogAsync(context,
          "Confirm removal".tr(), "${"Items".tr()}:\n ${deleteList.map((value) => value.toBasicString()).toList().join(",\n")}\n?",);
      if(!result) {
        return;
      }
    }

    for (var element in deleteList)
    {
      try
      {
        await element.deleteMethod();
      }
      catch(e)
      {
        ToastHelper.Show(e.toString(), severity: ToastSeverity.NotOk);
        return;
      }
      ToastHelper.Show("${"Deleted".tr()}: ${element.toBasicString()}");
    }

    var updatedSet = Set<T>.from(
        dataGrid.updatedRows.map((x) => fromPlutoJson(x.toJson())));

    var newSet = Set<T>.from(
        dataGrid.newRows.map((x) => fromPlutoJson(x.toJson())));

    updatedSet.addAll(newSet);

    for (var element in updatedSet.toList())
    {
      try
      {
        await element.updateMethod();
      }
      catch(e)
      {
        ToastHelper.Show(e.toString(), severity: ToastSeverity.NotOk);
        return;
      }
      ToastHelper.Show("${"Saved".tr()}: ${element.toBasicString()}");
    }
    await loadData();
  }

  Future<void> _cancelChanges() async {
    var result = await DialogHelper.showConfirmationDialogAsync(context, "Discard changes".tr(), "Really discard all changes?".tr());
    if(!result){
      return;
    }
    await loadData();
  }
}