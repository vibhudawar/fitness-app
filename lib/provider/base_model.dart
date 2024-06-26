import 'package:fitness_app/enum/view_state.dart';
import 'package:fitness_app/service/navigation_service.dart';
import 'package:flutter/material.dart';
import 'getit.dart';

class BaseModel extends ChangeNotifier {
  final navigationService = getIt<NavigationService>();
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;
  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
