// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApplyService implements ApplyService {
  _ApplyService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://airsoft-dev.herokuapp.com/applies';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Apply?> create(createApply) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(createApply.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>?>(
        _setStreamType<Apply>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data == null ? null : Apply.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> accept(applyId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/${applyId}/accept',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<void> decline(applyId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/${applyId}/decline',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  @override
  Future<Apply?> findByTeamIdAndUserId(teamId, userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'teamId': teamId,
      r'userId': userId
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>?>(
        _setStreamType<Apply>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/find',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data == null ? null : Apply.fromJson(_result.data!);
    return value;
  }

  @override
  Future<void> delete(applyId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    await _dio.fetch<void>(_setStreamType<void>(
        Options(method: 'DELETE', headers: _headers, extra: _extra)
            .compose(_dio.options, '/${applyId}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    return null;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
