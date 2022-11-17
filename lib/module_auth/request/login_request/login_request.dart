class LoginRequest {
  String? mobile;



  LoginRequest({this.mobile,});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile'] = this.mobile;
    return data;
  }
}
