class VerifyCodeRequest {
  String? phoneNumber;
  String? otp;

  VerifyCodeRequest({  this.otp, this.phoneNumber});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phoneNumber'] = this.phoneNumber;
    if (otp != null) {
      data['otp'] = otp;
    }
    return data;
  }
}
