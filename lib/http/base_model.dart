
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
