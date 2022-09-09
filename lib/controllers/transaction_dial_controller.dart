import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:stacked/stacked.dart';

import '../services/print_service.dart';
import '../setup.dart';

class TransactionDialController extends BaseViewModel {
  String number = "";

  final _printerService = locator<PrinterService>();

  List<BluetoothDevice> devices = [];

  BluetoothDevice? selectedDevice;

  String get cleanNumber => number.replaceAll(',', '');

  bool _confirmNoMultiplePoints(String value) {
    if (value != ".") {
      return true;
    } else {
      return !number.contains(".");
    }
  }

  bool _enforce(String value) {
    if (number.isEmpty && (value == "0" || value == ".")) {
      return false;
    }
    return true;
  }

  String _formatNumbers(String value) {
    if (value.contains(".")) {
      return value;
    } else {
      return value.replaceAll(",", "").replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (Match m) => '${m[1]},',
          );
    }
  }

  void callBack(String value) {
    if (_confirmNoMultiplePoints(value) &&
        _enforce(value) &&
        number.length < 10) {
      String tempValue = number.toString() + value;
      number = _formatNumbers(tempValue);
      notifyListeners();
    }
  }

  void deleteLastDigit() {
    if (number.isNotEmpty) {
      number = number.substring(0, number.length - 1);
      if (!number.contains(".")) {
        number = _formatNumbers(number.replaceAll(",", ""));
      }
      notifyListeners();
    }
  }

  Future<void> printReceipt() async {
    _printerService.printReciept(
      "BUSD",
      "2",
      "SUCCESSFUL",
      "COIN-APP-p4XBSX",
    );
  }

  Future<void> fetchPrinters() async {
    devices = await _printerService.getDevices();
    notifyListeners();
  }

  Future<void> connectToPrinter(BluetoothDevice device) async {
    selectedDevice = device;
    _printerService.connectPrinter(device);
    notifyListeners();
  }
}
