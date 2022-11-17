import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:sales_beeorder_app/abstracts/response/action_response.dart';
import 'package:sales_beeorder_app/di/di_config.dart';
import 'package:sales_beeorder_app/module_localization/service/localization_service/localization_service.dart';

import '../../utils/logger/logger.dart';

@injectable
class ApiClient {
  final Logger _logger;
  final String tag = 'ApiClient';

//  final performanceInterceptor = DioFirebasePerformanceInterceptor();

  ApiClient(this._logger);

  Future<WebServiceResponse?> get(
    String url, {
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
  }) async {
    try {
      _logger.info(tag, 'Requesting GET to: ' + url);
      _logger.info(tag, 'Headers: ' + headers.toString());
      _logger.info(tag, 'Query: ' + queryParams.toString());
      Dio client = Dio(BaseOptions(
        sendTimeout: 60000,
        receiveTimeout: 60000,
        connectTimeout: 60000,
      ));
      if (!kIsWeb) {
//        client.interceptors.add(performanceInterceptor);
      }
      if (headers != null) {
        if (headers['device_id'] != null) {
          _logger.info(tag, 'Adding Auth Header');
          client.options.headers['device_id'] = headers['device_id'];
        }
        _logger.info(tag, 'LANG');
       // client.options.headers['lang'] =
       //     getIt<LocalizationService>().getLanguage();
        // client.options.headers['Access-Control-Allow-Origin'] =
        //     '*';
      }
      //  client.options.headers['Access-Control-Allow-Origin'] = '*';
      var response = await client.get(
        url,
        queryParameters: queryParams,
      );
      return _processResponse(response);
    } catch (e) {
      print(e);
      _logger.info(tag, 'e');
      if (e is DioError) {
        DioError err = e;
        if (err.response != null) {
          if (err.response!.statusCode! < 501) {
//            _logger.error(
//                tag, err.message + ', GET: ' + url, StackTrace.current);
//            return {
//              'status_code': '${err.response?.statusCode?.toString() ?? '0'}'
//            };
          }
        }
      } else {
        _logger.error(tag, e.toString() + ', GET: ' + url, StackTrace.current);
      }
      return null;
    }
  }

  Future<WebServiceResponse?> post(
      String url,
      Map<String, dynamic> payLoad, {
        Map<String, String>? queryParams,
        Map<String, String>? headers,
        bool? jsonDataType,
      }) async {
    Dio client = Dio(BaseOptions(
      sendTimeout: 60000,
      receiveTimeout: 60000,
      connectTimeout: 60000,
    ));
    try {
      _logger.info(tag, 'Requesting Post to: ' + url);
      _logger.info(tag, 'POST: ' + payLoad.toString());
      _logger.info(tag, 'Headers: ' + jsonEncode(headers));
      if (headers != null) {
        if (headers['device_id'] != null) {
          _logger.info(tag, 'Adding Auth Header');
          client.options.headers['device_id'] = headers['device_id'];
        }
        if (headers['lang'] != null) {
          client.options.headers['lang'] = headers['lang'];
        }
        _logger.info(tag, 'LANG');
      }
      client.options.headers['version'] ='4.0.6';
      _logger.info(tag, 'Headers hello: ' + jsonEncode(client.options.headers));
      if (!kIsWeb) {
//        client.interceptors.add(performanceInterceptor);
      }
      if(jsonDataType != null ){
        var response = await client.post(
          url,
          queryParameters: queryParams,
          data: json.encode(payLoad) ,
        );
        return _processResponse(response);
      }else{
        var response = await client.post(
          url,
          queryParameters: queryParams,
          data: FormData.fromMap(payLoad),
        );
        print(response);
        print('----------------------------------------------------------------------------');
        return _processResponse(response);
      }

      // return _processResponse(response);
    } catch (e) {
      print(e.toString());
      if (e is DioError) {
        DioError err = e;
        if (err.response != null) {
          if (err.response!.statusCode! < 501) {
            _logger.error(
                tag, err.message + ', POST: ' + url, StackTrace.current);
            return _processResponse(err.response!);
          }
        }
      } else {
        _logger.error(tag, e.toString() + ', POST: ' + url, StackTrace.current);
//        return {'status_code': '-1'};
      }
    }
    return null;
  }

  WebServiceResponse? _processResponse(Response response) {
    print(response.statusCode);
    print('----------------------------------------------------');
    if (response.statusCode! < 500) {
      _logger.info(tag, response.data.toString());
      return WebServiceResponse.fromJson(response.data);
    } else {
      _logger.info(tag, response.data.toString());
      _logger.error(
          tag,
          response.statusCode.toString() + '\n\n' + response.data.toString(),
          StackTrace.current);
      return null;
    }
  }
}
