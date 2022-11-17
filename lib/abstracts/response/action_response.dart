
class WebServiceResponse {
  bool  _isSuccess = false;
  int? _codeInt;
  String? _codeStr;
  String? _message;
  dynamic _data;
  WebServiceResponse(this._codeInt , this._codeStr, this._message, this._data , this._isSuccess);
   WebServiceResponse.fromJson(Map<String, dynamic> item) {
     if(item['success'] != null){
       _isSuccess = item['success'];
     }
     if(item['result'] != null){
       _data = item['result'];
     }
     if(item['code'] != null && item['code'] is int){
       _codeInt = item['code'];
     }
     if(item['code'] != null && item['code'] is String){
       _codeStr = item['code'];
     }
     if(item['message'] != null){
       _message = item['message'];
     }
     if(item['msg'] != null){
       _message = item['msg'];
     }
  }
  get data => _data;
  String? get errorMessage => _message;
  int? get codeInt => _codeInt;
  String? get codeStr => _codeStr;
  bool get success => _isSuccess;
}

