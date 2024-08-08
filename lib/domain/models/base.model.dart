import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class BaseModel extends Equatable {
  final String id;

  const BaseModel({required this.id});

  @override
  @mustCallSuper
  List<Object?> get props => [id];

  Map<String, dynamic> toJson();
}

extension BaseModelListExtension<M extends BaseModel> on List<M> {
  bool containsById(M model) {
    return any((element) => element.id == model.id);
  }

  void removeById(M model) {
    removeWhere((element) => element.id == model.id);
  }
}
