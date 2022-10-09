import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_simple_abstract.dart';
import 'package:cbj_smart_device/infrastructure/gen/cbj_smart_device_server/protoc_as_dart/cbj_smart_device_server.pbgrpc.dart';

class LightObject extends SmartDeviceSimpleAbstract {
  LightObject(
    String? uuid,
    String? smartInstanceName,
    int? onOffPinNumber,
  ) : super(
          uuid,
          smartInstanceName,
          onOffPinNumber,
          onOffButtonPinNumber: null,
        ) {
    setDeviceType(DeviceTypes.light);
    print('New light object');
  }

  @override
  List<String> getNeededPinTypesList() => <String>['gpio'];

  @override
  static List<String> neededPinTypesList() => <String>['gpio'];

  ///  Return smart device type
  @override
  DeviceTypes getDeviceType() => DeviceTypes.light;

  @override
  Future<String> executeActionString(
    String wishString,
    DeviceStateGRPC deviceState,
  ) async {
    final DeviceActions deviceAction =
        convertWishStringToWishesObject(wishString)!;
    return executeDeviceAction(deviceAction, deviceState);
  }

  @override
  Future<String> executeDeviceAction(
    DeviceActions deviceAction,
    DeviceStateGRPC deviceState,
  ) async {
    return wishInSimpleClass(deviceAction, deviceState);
  }
}