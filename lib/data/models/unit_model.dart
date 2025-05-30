import 'package:fstapp/components/features/feature.dart';
import 'package:fstapp/data/models/occasion_model.dart';
import 'package:fstapp/data/models/tb.dart';
import 'package:fstapp/data/models/unit_user_model.dart';

class UnitModel {
  int? id;
  String? title;
  Map<String, dynamic>? data;
  List<Feature>? features;
  int? organization;
  List<OccasionModel>? occasions;
  UnitUserModel? unitUser;

  UnitModel({
    this.id,
    this.title,
    this.data,
    this.features,
    this.organization,
    this.occasions,
    this.unitUser,
  });

  factory UnitModel.fromJson(Map<String, dynamic> json) {
    return UnitModel(
      id: json[Tb.units.id],
      title: json[Tb.units.title],
      data: json[Tb.units.data],
      features: json[Tb.units.features] is List
          ? List<Feature>.from(
          (json[Tb.units.features] as List)
              .map((x) => Feature.fromJson(x)))
          : [],
      organization: json[Tb.units.organization],
      occasions: json[Tb.occasions.table] != null
          ? List<OccasionModel>.from(
          (json[Tb.occasions.table] as List)
              .map((x) => OccasionModel.fromJson(x)))
          : [],
      unitUser: json["unit_user"] != null
          ? UnitUserModel.fromJson(json["unit_user"])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      Tb.units.id: id,
      Tb.units.title: title,
      Tb.units.data: data,
      Tb.units.features: features,
      Tb.units.organization: organization,
      "unit_user": unitUser?.toJson(),
    };
  }
}
