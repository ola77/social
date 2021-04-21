import 'dart:io';

Future<bool> isInternetConnected() async {
  

  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    } else
      return false;
  } on SocketException catch (_) {
    return false;
  } catch(_){
    return false;
  }

}

String internetErrorMessage()  =>'No internet conection';
