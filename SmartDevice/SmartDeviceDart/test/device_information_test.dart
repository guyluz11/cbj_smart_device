import 'package:SmartDeviceDart/core/device_information.dart';
import 'package:test/test.dart';

void main() {
  test('DeviceInformation', () {
    var deviceMacAddress = '30:23:a2:G3:34';
    var deviceName = 'Guy ceiling light';

    var deviceInformation =
        DeviceInformation(deviceMacAddress, deviceName);

    expect(deviceInformation.getMacAddress(), deviceMacAddress);
    expect(deviceInformation.getName(), deviceName);
  });

  test('RemoteDevice', () {
    var deviceMacAddress = '30:23:a2:G3:34';
    var deviceName = 'Guy ceiling light';
    var deviceIp = '10.0.0.10';

    var deviceInformation =
        RemoteDevice(deviceMacAddress, deviceName, deviceIp);

    expect(deviceInformation.getMacAddress(), deviceMacAddress);
    expect(deviceInformation.getName(), deviceName);
    expect(deviceInformation.getIp(), deviceIp);
  });

  test('LocalDevice', () {
    var deviceMacAddress = "30:23:a2:G3:34";
    var deviceName = "Guy ceiling light";

    var deviceInformation = LocalDevice(deviceMacAddress, deviceName);

    expect(deviceInformation.getMacAddress(), deviceMacAddress);
    expect(deviceInformation.getName(), deviceName);
  });
}