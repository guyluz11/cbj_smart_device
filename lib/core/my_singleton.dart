import 'package:cbj_integrations_controller/infrastructure/system_commands/system_commands_manager_d.dart';
import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base_abstract.dart';

class MySingleton {
  factory MySingleton() {
    return _singleton;
  }

  MySingleton._internal() {
    smartDevicesList = <SmartDeviceBaseAbstract>[];
    getUuid();
    getCurrentUserName();
  }

  static final MySingleton _singleton = MySingleton._internal();
  List<SmartDeviceBaseAbstract> smartDevicesList = [];
  Future<String>? _deviceUid;
  Future<String>? _currentUserName;

  Future<String> getUuid() =>
      _deviceUid ??= SystemCommandsManager().getUuidOfCurrentDevice();

  Future<String?> getCurrentUserName() =>
      _currentUserName ??= SystemCommandsManager().getCurrentUserName();

  void setSmartDevicesList(
    List<SmartDeviceBaseAbstract> smartDeviceListVal,
  ) {
    smartDevicesList = smartDeviceListVal;
  }

  void addToSmartDevicesList(SmartDeviceBaseAbstract smartDeviceVal) {
    smartDevicesList.add(smartDeviceVal);
  }

  List<SmartDeviceBaseAbstract> getSmartDevicesList() => smartDevicesList;
}

class CbjFirebaseAccountInformationFlutter {
  CbjFirebaseAccountInformationFlutter(
    this.fireBaseProjectId,
    this.fireBaseApiKey,
    this.userEmail,
    this.userPassword,
  );

  String fireBaseProjectId;
  String fireBaseApiKey;
  String userEmail;
  String userPassword;

  bool areAllValuesNotNull() {
    return fireBaseApiKey != null;
  }
}
