abstract class BaseConfig {
  String get serverUrl ; 
  // FireBaseOptions get

}

class DevConfig implements BaseConfig {
  @override
   String get serverUrl => 'https://api.time-flow.io.vn/api/v1/solara';
}

class AppEnv {
   static BaseConfig config = DevConfig();
   
}