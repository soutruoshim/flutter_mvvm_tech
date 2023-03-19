import '../data/responses/response.dart';

class SliderObject{
  String title;
  String subTitle;
  String image;

  SliderObject(this.title,  this.subTitle, this.image);
}

class Customer{
  String id;
  String name;
  int numOfNotification;

  Customer(this.id, this.name, this.numOfNotification);
}

class Contacts{
  String phone;
  String link;
  String email;

  Contacts(this.phone, this.link, this.email);

}

class Authentication{
  Customer? customer;
  Contacts? contacts;
  Authentication(this.customer, this.contacts);
}

