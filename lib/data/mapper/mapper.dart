// to convert the response into a on nullable
import 'package:flutter_mvvm_tech/app/extensions.dart';
import 'package:flutter_mvvm_tech/data/responses/response.dart';
import 'package:flutter_mvvm_tech/domain/model.dart';

const EMPTY = "";
const ZERO = 0;

extension CustomerResponseMapper on CustomerResponse?{
  Customer toDomain(){
     return Customer(this?.id?.orEmpty()??EMPTY, this?.name?.orEmpty()??EMPTY, this?.numOfNotification?.orZero()??ZERO);
  }
}

extension ContactsResponseMapper on ContactsResponse?{
  Contacts toDomain(){
    return Contacts(this?.phone?.orEmpty()??EMPTY, this?.link?.orEmpty()??EMPTY, this?.email?.orEmpty()??EMPTY);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse?{
  Authentication toDomain(){
    return Authentication(this?.customer.toDomain(), this?.contacts.toDomain());
  }
}