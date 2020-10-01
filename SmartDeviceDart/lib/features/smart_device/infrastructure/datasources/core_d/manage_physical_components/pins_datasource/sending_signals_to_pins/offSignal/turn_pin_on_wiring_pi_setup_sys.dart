import 'dart:io';

import '../../../../../../../../../core/shared_variables.dart';

class TurnPinOffWiringPiSetupSys {
  Future<ProcessResult> TurnThePinOff(String physicalPinNumber) async {
    return await Process.run(
        SharedVariables.getProjectRootDirectoryPath() +
            '/scripts/cScripts/phisicalComponents/sendingSignals/offSignal/turnOffWiringPiSetupSys',
        [physicalPinNumber]);
  }
}
