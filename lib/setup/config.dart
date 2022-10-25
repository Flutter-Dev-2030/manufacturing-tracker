class Config {
  // static const String _rpcURL = "http://10.0.2.2:7545";
  // static const String _wsURL = "ws://10.0.2.2:7545/";

  // static const String _rpcURL = "http://127.0.0.1:7545";
  // static const String _wsURL = "ws://127.0.0.1:7545/";

  static const String _rpcURL =
      "https://goerli.infura.io/v3/edce2586c06f42bbb7f5ff69c4d092da";
  static const String _wsURL =
      "https://goerli.infura.io/v3/edce2586c06f42bbb7f5ff69c4d092da";

  static String get rpcURL => _rpcURL;
  static String get wsURL => _wsURL;
}

// you can select the host and port from the server menu in the ganache app and copy it here 
// LOCALHOST: "http://127.0.0.1:7545/"
// EMULATOR LOCALHOST: "http://10.0.2.2:7545/"
// you can also use here your wifi url