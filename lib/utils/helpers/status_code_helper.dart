import 'package:sales_beeorder_app/consts/order_status.dart';
import 'package:sales_beeorder_app/generated/l10n.dart';

class StatusCodeHelper {
  static String getStatusCodeMessages(var statusCode) {
    if (statusCode is int) {
      statusCode = statusCode.toString();
    }
    statusCode ??= '0';
    switch (statusCode) {
      case '200':
//        return S.current.statusCodeOk;
//      case '201':
//        return S.current.statusCodeCreated;
//      case '400':
//        return S.current.statusCodeBadRequest;
//      case '401':
//        return S.current.statusCodeUnauthorized;
//      case '403':
//        return S.current.forbidden;
//      case '404':
//        return S.current.StatusCodeNotFound;
//      case '500':
//        return S.current.internalServerError;
//      case '9000':
//        return S.current.invalidCredentials;
//      case '9001':
//        return S.current.accountAlreadyExist;
//      case '-1':
//        return S.current.dataDecodeError;
      default:
        return S.current.errorHappened;
    }
  }

  static String getMailTypeMessages(int statusCode) {
    switch (statusCode) {
      case 0:
        return 'IMG';
      case 1:
        return'ZIP';
      case 2:
        return 'PDF';
      case 3:
        return 'PHOTOSHOP';
      case 4:
        return 'WORD';
      case 5:
        return 'EXCEL';
      default:
        return 'UnKnow';
    }
  }
  static String getMonthMessages(int statusCode) {
    switch (statusCode) {
      case 0:
        return '01-';
      case 1:
        return'02-';
      case 2:
        return '03-';
      case 3:
        return '04-';
      case 4:
        return '05-';
      case 5:
        return '06-';
      case 6:
        return '07-';
      case 7:
        return '08-';
      case 8:
        return '09-';
      case 9:
        return '10-';
      case 10:
        return '11-';
      case 11:
        return '12-';
      default:
        return 'UnKnow';
    }
  }
}
