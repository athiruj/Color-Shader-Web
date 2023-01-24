
import 'package:flutter/foundation.dart';

class StateProvider with ChangeNotifier{
  bool state = false;

  bool getState(){
    return state;
  }

  changeState(bool newState){
    state = newState;
    
  }
}