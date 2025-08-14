import 'dart:developer';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_share_flat/utils/app_urls.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketServices {
  static late io.Socket socket;
  static bool isConnected = false;

  /// Connect to the socket
  static Future<void> connectToSocket({String token = ""}) async {
    log("Socket Token ======$token");

    if (token.isEmpty) {
      log("Error: Token is null or empty. Cannot connect to socket.");
      return;
    }

    // Initialize the socket
    socket = io.io(
      AppUrls.socketUrl,
      io.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .setExtraHeaders({"token": token})
          .build(),
    );

    // Connection event
    socket.onConnect((_) {
      isConnected = true;
      log("Socket connected successfully.");
    });

    // Connection error event
    socket.onConnectError((data) {
      isConnected = false;
      log("Socket connection error: $data");
    });

    socket.on('connect_error', (error) {
      log('Socket connection error: $error');
    });

    // Disconnection event
    socket.onDisconnect((data) {
      isConnected = false;
      log("Socket disconnected. $data");
    });

    // Connect the socket
    socket.connect();
  }

  /// Disconnect the socket and clean up
  static void disconnectSocket() {
    if (socket.connected) {
      socket.disconnect();
      socket.dispose();
      isConnected = false;
      log("Socket disconnected and resources cleaned up.");
    } else {
      log("Socket is already disconnected.");
    }
  }

  /// Get Location Method
  static Future<LatLng?> getLocation({required String userId}) async {
    try {
      log('Get Location is being called');


      // Check if the socket is connected before emitting
      if (socket.connected) {
        log('Socket is connected. Getting client_location event.');
        log('User Id: $userId');

        // ::$userId
        socket.on("server_location::$userId", (data) {

          log("======>>>${data["lat"]}<<<=======");
          log("======>>>${data["lang"]}<<<=======");

          return LatLng(double.parse(data["lat"]), double.parse(data["lang"]));

        },);
      } else {
        log('Socket is not connected. Unable to emit event.');
      }
    } catch (error, stackTrace) {
      // Catch any unexpected errors and log them
      log('Error in sendLocation: $error');
      log('Stack Trace: $stackTrace');
      return null;
    }
    return null;
  }
}
