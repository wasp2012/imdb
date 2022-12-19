// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_service_for_movies.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _WebServicesForMovies implements WebServicesForMovies {
  _WebServicesForMovies(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://api.themoviedb.org/3';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<NowPlayingMovieModel> getMoviesPlayingNow(apiKey) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'api_key': apiKey};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<NowPlayingMovieModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/movie/now_playing',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NowPlayingMovieModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PopularMovieModel> getMoviesPopular(apiKey) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'api_key': apiKey};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<PopularMovieModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/movie/popular',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PopularMovieModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<TopRatedMovieModel> getMoviesTopRated(apiKey) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'api_key': apiKey};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<TopRatedMovieModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/movie/top_rated',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TopRatedMovieModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UpcomingMovieModel> getMoviesUpComing(apiKey) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'api_key': apiKey};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<UpcomingMovieModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/movie/upcoming',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UpcomingMovieModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(
    apiKey,
    id,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'api_key': apiKey};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MovieDetailsModel>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/movie/${id}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MovieDetailsModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<MovieVideoById> getMovieVideos(
    apiKey,
    id,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'api_key': apiKey};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<MovieVideoById>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/movie/${id}/videos',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = MovieVideoById.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SearchedMovies> getSearchedMovies(
    apiKey,
    query,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'api_key': apiKey,
      r'query': query,
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<SearchedMovies>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/search/movie',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SearchedMovies.fromJson(_result.data!);
    return value;
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
