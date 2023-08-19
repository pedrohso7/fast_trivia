import 'package:get/get_connect/connect.dart';

class BSClient extends GetConnect {
  BSClient() {
    httpClient.baseUrl = "https://api.brawlstars.com/v1/";
    const String token =
        "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsImtpZCI6IjI4YTMxOGY3LTAwMDAtYTFlYi03ZmExLTJjNzQzM2M2Y2NhNSJ9.eyJpc3MiOiJzdXBlcmNlbGwiLCJhdWQiOiJzdXBlcmNlbGw6Z2FtZWFwaSIsImp0aSI6ImE5ZTFmNTFlLTVhMzQtNDU3Ni05NTUyLTFiYTRiMDE0YTg3NCIsImlhdCI6MTY5MjEyMDQwNSwic3ViIjoiZGV2ZWxvcGVyLzJlNzA4NGQyLTEwZjEtYTVjYS00NjY0LWMzMTk2MWE5ZWQ4NyIsInNjb3BlcyI6WyJicmF3bHN0YXJzIl0sImxpbWl0cyI6W3sidGllciI6ImRldmVsb3Blci9zaWx2ZXIiLCJ0eXBlIjoidGhyb3R0bGluZyJ9LHsiY2lkcnMiOlsiMTc3LjczLjE5NC41NiJdLCJ0eXBlIjoiY2xpZW50In1dfQ.bDobilZgqpzXQTFXXvCcfWqKGXDqYr6Kum-fFqFI3bZq7r2SiKMbP0_YuyyChVNjC7lUmMwucEX8y0dvV99HSg";
    httpClient.addRequestModifier<Object?>((request) {
      request.headers['Authorization'] = 'Bearer $token';
      return request;
    });
  }
}
