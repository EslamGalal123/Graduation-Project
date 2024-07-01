// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_blue/flutter_blue.dart';

// class MyWatchView extends StatefulWidget {
//   const MyWatchView({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _MyWatchViewState createState() => _MyWatchViewState();
// }

// class _MyWatchViewState extends State<MyWatchView> {
//   final FlutterBlue flutterBlue = FlutterBlue.instance;
//   List<double> sugarValues = [];
//   List<double> heartRateValues = [];
//   double latestHeartRate = 0.0;
//   double latestSugarValue = 0.0;
//   bool isDeviceConnected = false;
//   bool isDataReceived = false;

//   @override
//   void initState() {
//     super.initState();
//     _startScan();
//   }

//   void _startScan() {
//     flutterBlue.startScan(timeout: const Duration(seconds: 4));
//     flutterBlue.scanResults.listen((List<ScanResult> results) {
//       for (ScanResult result in results) {
//         if (result.device.name == 'HC-05') {
//           _connectToDevice(result.device);
//           break; // Stop scanning once the device is found
//         }
//       }
//     });
//   }

//   void _connectToDevice(BluetoothDevice device) async {
//     await device.connect();
//     setState(() {
//       isDeviceConnected = true;
//     });
//     List<BluetoothService> services = await device.discoverServices();
//     for (BluetoothService service in services) {
//       for (BluetoothCharacteristic characteristic in service.characteristics) {
//         if (characteristic.properties.read) {
//           characteristic.read().then((value) {
//             double parsedValue = double.parse(String.fromCharCodes(value));
//             setState(() {
//               isDataReceived = true;
//             });
//             if (characteristic.uuid.toString() == '00002a18-0000-1000-8000-00805f9b34fb') {
//               setState(() {
//                 sugarValues.add(parsedValue);
//                 latestSugarValue = parsedValue;
//               });
//             } else if (characteristic.uuid.toString() == '00002a37-0000-1000-8000-00805f9b34fb') {
//               setState(() {
//                 heartRateValues.add(parsedValue);
//                 latestHeartRate = parsedValue;
//               });
//             }
//           });
//         }
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Watch App'),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: CustomScrollView(
//             physics: const BouncingScrollPhysics(),
//             slivers: [
//               SliverToBoxAdapter(
//                 child: Column(
//                   children: [
//                     if (isDeviceConnected) ...[
//                       const Text('Device connected successfully.'),
//                     ] else ...[
//                       const Text('Searching for device...'),
//                     ],
//                     if (isDataReceived) ...[
//                       const Text('Data received successfully.'),
//                     ] else ...[
//                       const Text('Waiting for data...'),
//                     ],
//                     CustomMyWatchForm(sugarValues: sugarValues),
//                     const Divider(
//                       height: 1,
//                       thickness: 2,
//                       endIndent: 10,
//                       indent: 10,
//                     ),
//                     CustomHeartRate(
//                         heartRateValues: heartRateValues,
//                         latestHeartRate: latestHeartRate),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomHeartRate extends StatelessWidget {
//   final List<double> heartRateValues;
//   final double latestHeartRate;

//   const CustomHeartRate(
//       {required this.heartRateValues, required this.latestHeartRate, Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 10),
//         const Text("Pulse-Rate"),
//         const SizedBox(height: 10),
//         LineChartWidget(heartRateValues: heartRateValues),
//         Row(
//           children: [
//             const Text("Heart Beats :  "),
//             Container(
//               width: 80,
//               height: 25,
//               decoration:
//                   BoxDecoration(border: Border.all(style: BorderStyle.solid)),
//               child: Center(child: Text(latestHeartRate.toString())),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class CustomMyWatchForm extends StatelessWidget {
//   final List<double> sugarValues;

//   const CustomMyWatchForm({required this.sugarValues, Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Row(
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Alaa",
//                     style: TextStyle(
//                       letterSpacing: 3,
//                       color: Colors.black,
//                       fontFamily: "poppins",
//                       fontSize: 44,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 10),
//         Row(
//           children: [
//             const Text("Blood Sugar Type :      "),
//             Container(
//               width: 80,
//               height: 25,
//               decoration:
//                   BoxDecoration(border: Border.all(style: BorderStyle.solid)),
//             )
//           ],
//         ),
//         const SizedBox(height: 10),
//         Row(
//           children: [
//             const Text("Dia Best Reading :       "),
//             Container(
//               width: 80,
//               height: 25,
//               decoration:
//                   BoxDecoration(border: Border.all(style: BorderStyle.solid)),
//               child: Center(
//                   child: Text(sugarValues.isNotEmpty
//                       ? sugarValues.last.toString()
//                       : '')),
//             ),
//           ],
//         ),
//         const SizedBox(height: 10),
//         const Row(
//           children: [
//             Text("Classification Sugar :"),
//           ],
//         ),
//         const SizedBox(height: 10),
//         Row(
//           children: [
//             const Text("Classification Sugar :  "),
//             Container(
//               width: 80,
//               height: 25,
//               decoration:
//                   BoxDecoration(border: Border.all(style: BorderStyle.solid)),
//             ),
//           ],
//         ),
//         const SizedBox(height: 10),
//         const Row(
//           children: [
//             Text("Medical Test"),
//           ],
//         ),
//         const SizedBox(height: 15),
//         Row(
//           children: [
//             Expanded(
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       const Text("RBS :  "),
//                       Container(
//                         width: 80,
//                         height: 25,
//                         decoration: BoxDecoration(
//                             border: Border.all(style: BorderStyle.solid)),
//                         child: Center(
//                             child: Text(sugarValues.isNotEmpty
//                                 ? sugarValues.last.toString()
//                                 : '')),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   Row(
//                     children: [
//                       const Text("HbA1c :  "),
//                       Container(
//                         width: 80,
//                         height: 25,
//                         decoration: BoxDecoration(
//                             border: Border.all(style: BorderStyle.solid)),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 15),
//       ],
//     );
//   }
// }

// class LineChartWidget extends StatelessWidget {
//   final List<double> heartRateValues;

//   const LineChartWidget({required this.heartRateValues, Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 1.65,
//       child: LineChart(
//         LineChartData(
//           lineBarsData: [
//             LineChartBarData(
//               spots: heartRateValues
//                   .asMap()
//                   .entries
//                   .map((e) => FlSpot(e.key.toDouble(), e.value))
//                   .toList(),
//               isCurved: true,
//               dotData: const FlDotData(show: false),
//               color: Colors.black,
//               barWidth: 2,
//             ),
//           ],
//           backgroundColor: const Color(0xFFF9F5F5),
//           titlesData: const FlTitlesData(
//             show: false,
//           ),
//           gridData: const FlGridData(
//             show: true,
//             drawHorizontalLine: true,
//           ),
//           borderData: FlBorderData(
//             border: Border.all(width: 0),
//           ),
//         ),
//       ),
//     );
//   }
// }

////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////
///ىىىىىىىىىىىىىىىىىىىىىىىىىىىىىىىىىىى
// import 'dart:convert';
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

// class BluetoothApp extends StatefulWidget {
//   @override
//   _BluetoothAppState createState() => _BluetoothAppState();
// }

// class _BluetoothAppState extends State<BluetoothApp> {
//   BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
//   BluetoothDevice? _device;
//   BluetoothConnection? _connection;
//   bool _isConnected = false;
//   String _dataReceived = '';

//   @override
//   void initState() {
//     super.initState();

//     FlutterBluetoothSerial.instance.state.then((state) {
//       setState(() {
//         _bluetoothState = state;
//       });
//     });

//     FlutterBluetoothSerial.instance.onStateChanged().listen((BluetoothState state) {
//       setState(() {
//         _bluetoothState = state;
//       });
//     });
//   }

//   @override
//   void dispose() {
//     if (_connection != null) {
//       _connection!.dispose();
//       _connection = null;
//     }
//     super.dispose();
//   }

//   void _startConnection() async {
//     if (_device != null) {
//       try {
//         _connection = await BluetoothConnection.toAddress(_device!.address);
//         setState(() {
//           _isConnected = true;
//         });

//         _connection!.input!.listen((Uint8List data) {
//           setState(() {
//             _dataReceived = utf8.decode(data);
//           });
//         }).onDone(() {
//           setState(() {
//             _isConnected = false;
//           });
//         });
//       } catch (exception) {
//         print('Cannot connect, exception occurred');
//         print(exception);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bluetooth Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Bluetooth State: $_bluetoothState'),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () async {
//                 final BluetoothDevice? selectedDevice = await Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => SelectDevicePage(),
//                   ),
//                 );

//                 if (selectedDevice != null) {
//                   setState(() {
//                     _device = selectedDevice;
//                   });
//                 }
//               },
//               child: Text('Select Device'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _device != null && !_isConnected ? _startConnection : null,
//               child: Text(_isConnected ? 'Connected' : 'Connect'),
//             ),
//             SizedBox(height: 20),
//             Text('Received Data: $_dataReceived'),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SelectDevicePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Select Device'),
//       ),
//       body: FutureBuilder<List<BluetoothDevice>>(
//         future: FlutterBluetoothSerial.instance.getBondedDevices(),
//         builder: (BuildContext context, AsyncSnapshot<List<BluetoothDevice>> snapshot) {
//           if (snapshot.hasData) {
//             return ListView(
//               children: snapshot.data!.map((device) {
//                 return ListTile(
//                   title: Text(device.name ?? 'Unknown device'),
//                   subtitle: Text(device.address),
//                   onTap: () {
//                     Navigator.of(context).pop(device);
//                   },
//                 );
//               }).toList(),
//             );
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothApp extends StatefulWidget {
  @override
  _BluetoothAppState createState() => _BluetoothAppState();
}

class _BluetoothAppState extends State<BluetoothApp> {
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  BluetoothDevice? _device;
  BluetoothConnection? _connection;
  bool _isConnected = false;
  String _value1 = '';
  String _value2 = '';

  @override
  void initState() {
    super.initState();

    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });

    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      setState(() {
        _bluetoothState = state;
      });
    });
  }

  @override
  void dispose() {
    if (_connection != null) {
      _connection!.dispose();
      _connection = null;
    }
    super.dispose();
  }

  void _startConnection() async {
    if (_device != null) {
      try {
        _connection = await BluetoothConnection.toAddress(_device!.address);
        setState(() {
          _isConnected = true;
        });
        print('Connected to the device');

        _connection!.input!.listen((Uint8List data) {
          String dataStr = utf8.decode(data);
          print('Data received: $dataStr');
          setState(() {
            List<String> values = dataStr.split(',');
            if (values.length >= 2) {
              _value1 = values[0];
              _value2 = values[1];
              print("value1 $_value1");
              print("value2 $_value2");
            } else {
              print('Received data does not contain two values');
            }
          });
        }).onDone(() {
          setState(() {
            _isConnected = false;
          });
          print('Disconnected by remote request');
        });
      } catch (exception) {
        print('Cannot connect, exception occurred');
        print(exception);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bluetooth Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Bluetooth State: $_bluetoothState'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final BluetoothDevice? selectedDevice =
                    await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SelectDevicePage(),
                  ),
                );

                if (selectedDevice != null) {
                  setState(() {
                    _device = selectedDevice;
                  });
                }
              },
              child: Text('Select Device'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  _device != null && !_isConnected ? _startConnection : null,
              child: Text(_isConnected ? 'Connected' : 'Connect'),
            ),
            SizedBox(height: 20),
            Text('Value 1: $_value1'),
            Text('Value 2: $_value2'),
          ],
        ),
      ),
    );
  }
}

class SelectDevicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Device'),
      ),
      body: FutureBuilder<List<BluetoothDevice>>(
        future: FlutterBluetoothSerial.instance.getBondedDevices(),
        builder: (BuildContext context,
            AsyncSnapshot<List<BluetoothDevice>> snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.map((device) {
                return ListTile(
                  title: Text(device.name ?? 'Unknown device'),
                  subtitle: Text(device.address),
                  onTap: () {
                    Navigator.of(context).pop(device);
                  },
                );
              }).toList(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
