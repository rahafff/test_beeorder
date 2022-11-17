class GenerateOtpRequest {
  String? phoneNumber;

  GenerateOtpRequest(this.phoneNumber);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PhoneNumber'] = this.phoneNumber;
    return data;
  }

}