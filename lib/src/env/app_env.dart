abstract class BaseConfig {
  String get serverUrl ; 
  // FireBaseOptions get

}

class DevConfig implements BaseConfig {
  @override
   String get serverUrl => '';
}

class AppEnv {
   static BaseConfig config = DevConfig();
   

}