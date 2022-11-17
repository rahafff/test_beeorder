class RegisterRequest {
  String? firstName;
  String? mobile;
  String? lastName;
  String? licensePlate;
  int? cityId;
  int? vehicle;

  RegisterRequest(
      {this.firstName,
      this.mobile,
      this.lastName,
      this.licensePlate,
      this.cityId ,this.vehicle});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobile'] = this.mobile;
    data['firstName'] = this.firstName;
    data['licensePlate'] = this.licensePlate;
    data['lastName'] = this.lastName;
    data['cityId'] = this.cityId;
    data['vehicle'] = this.vehicle;
    return data;
  }
}
