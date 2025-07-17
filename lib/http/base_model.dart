import 'package:json_annotation/json_annotation.dart';

class BaseModel<T> {
  T? data;
  int? errorCode;
  String? errorMsg;

  BaseModel({this.data, this.errorCode, this.errorMsg});

  BaseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }
}

// abstract class Serializable<T extends JsonSerializable>{

// List<T>? arrayFromJson(dynamic json){
//   if(json != null && json is List){
//     return json.map((element) => T.fromJson(element)).toList();
//   }
//   return null;
// }
// }
