class MyDateUtils {
  String getdayName(int index) {
    if (index == 1) {
      return 'Monday';
    } else if (index == 2) {
      return 'Tuesday';
    } else if (index == 3) {
      return 'Wednesday';
    } else if (index == 4) {
      return 'Thursday';
    } else if (index == 5) {
      return 'Friday';
    } else if (index == 6) {
      return 'Saturday';
    } else {
      return 'Sunday';
    }
  }
//
//  String getMonthName(int index) {
//    switch (index) {
//      case 1:
//        return 'January'.tr;
//        break;
//      case 2:
//        return 'February'.tr;
//        break;
//      case 3:
//        return 'March'.tr;
//        break;
//      case 4:
//        return 'April'.tr;
//        break;
//      case 5:
//        return 'May'.tr;
//        break;
//      case 6:
//        return 'June'.tr;
//        break;
//      case 7:
//        return 'July'.tr;
//        break;
//      case 8:
//        return 'August'.tr;
//        break;
//      case 9:
//        return 'September'.tr;
//        break;
//      case 10:
//        return 'October'.tr;
//        break;
//      case 11:
//        return 'November'.tr;
//        break;
//      case 12:
//        return 'December'.tr;
//        break;
//      default:
//        return '';
//    }
//  }
//
//  String transferHours24To12(String number) {
//    int num = int.parse(number.split(':')[0]);
//    number = number.split(':')[1];
//    if (num > 12) {
//      num -= 12;
//      return '$num' + ':' + number + ' ' + 'pm'.tr;
//    } else if (num >= 10) return '$num' + ':' + number + ' ' + 'am'.tr;
//    return '0$num' + ':' + number + ' ' + 'am'.tr;
//  }
}