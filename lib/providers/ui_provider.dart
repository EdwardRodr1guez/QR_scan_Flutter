import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier  {
 int _selectedMenuOpt = 1; //se cambia mediante getter y setter

 int get selectedMenuOpt {
  return this._selectedMenuOpt;
 }

 set selectedMenuOpt (int i){
  this._selectedMenuOpt = i;
  notifyListeners();
 }

}