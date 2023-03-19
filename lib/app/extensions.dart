// extension on string
import 'package:flutter_mvvm_tech/data/mapper/mapper.dart';

extension NonNullString on String?{
  String orEmpty(){
     if(this == null){
        return EMPTY;
     }else{
       return this!;
     }
  }
}

// extension on Int
extension NonNullInteger on int?{
  int orZero(){
    if(this == null){
      return ZERO;
    }else{
      return this!;
    }
  }
}