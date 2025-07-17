import 'package:flutter_sample/pages/profile/profile_vm.dart';

class ProfileListModel {

  String title;
  ProfileListItemType id;
  String? link;

  ProfileListModel({required this.id,required this.title,this.link});
}
