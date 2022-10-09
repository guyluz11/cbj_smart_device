import 'package:cbj_smart_device/application/usecases/smart_device_objects_u/abstracts_devices/smart_device_base.dart';
import 'package:cbj_smart_device/infrastructure/gen/cbj_smart_device_server/protoc_as_dart/cbj_smart_device_server.pbgrpc.dart';

///  Abstract class for smart devices with on time property
abstract class SmartDeviceSimpleAbstract extends SmartDeviceBase {
  SmartDeviceSimpleAbstract(
    String? uuid,
    String? deviceName,
    int? onOffPinNumber, {
    int? onOffButtonPinNumber,
  }) : super(
          uuid,
          deviceName,
          onOffPinNumber,
          onOffButtonPinNumber: onOffButtonPinNumber,
        );

  ///  How much time the smart device was active (Doing action) continuously
  double? howMuchTimeTheDeviceDoingAction;

  @override
  static List<String> neededPinTypesList() => [];

  @override
  Future<String> executeActionString(
    String deviceActionString,
    DeviceStateGRPC deviceState,
  ) async {
    final DeviceActions? deviceAction =
        convertWishStringToWishesObject(deviceActionString);
    return executeDeviceAction(deviceAction!, deviceState);
  }

  @override
  Future<String> executeDeviceAction(
    DeviceActions deviceAction,
    DeviceStateGRPC deviceState,
  ) async {
    return wishInSimpleClass(deviceAction, deviceState);
  }

  ///  All the wishes that are legit to execute from the simple class
  String wishInSimpleClass(
    DeviceActions deviceAction,
    DeviceStateGRPC deviceState,
  ) {
    if (deviceAction == null) return 'Your wish does not exist on simple class';
    return wishInBaseClass(deviceAction, deviceState);
  }
}