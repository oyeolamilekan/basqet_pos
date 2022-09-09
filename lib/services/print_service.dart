import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:intl/intl.dart';

class PrinterService {
  BlueThermalPrinter printer = BlueThermalPrinter.instance;

  Future<List<BluetoothDevice>> getDevices() async {
    final List<BluetoothDevice> devices = await printer.getBondedDevices();
    return devices;
  }

  Future<void> printReciept(
    String coinType,
    String amount,
    String status,
    String txId,
  ) async {
    final now = DateTime.now();
    final dateFormatter = DateFormat('yyyy, MMMM dd');
    final timeFormatter = DateFormat('hh:mm a');
    String formattedDate = dateFormatter.format(now);
    String formattedTime = timeFormatter.format(now);

    printer.printNewLine();
    printer.printNewLine();
    printer.printLeftRight("COIN:", coinType, 1);
    printer.printNewLine();
    printer.printLeftRight("AMOUNT:", amount, 1);
    printer.printNewLine();
    printer.printLeftRight("STATUS:", status, 1);
    printer.printNewLine();
    printer.printLeftRight("TRX ID:", txId, 1);
    printer.printNewLine();
    printer.printLeftRight("DATE:", formattedDate, 1);
    printer.printNewLine();
    printer.printLeftRight("TIME:", formattedTime, 1);
    printer.printNewLine();
    printer.printLeftRight("MERCHANT:", "OYE ENTERPRISE", 1);
    printer.printNewLine();
    printer.printCustom("Proudly powered by quidax.", 2, 3);
    printer.printNewLine();
    printer.printNewLine();
    printer.printNewLine();
    printer.paperCut();
  }

  void connectPrinter(BluetoothDevice device) async {
    await printer.connect(device);
  }
}
