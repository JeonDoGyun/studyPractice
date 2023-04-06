import 'dart:io';
import 'package:flutter/material.dart';
import 'package:excel/excel.dart';

void main() {
  final bytes =
      File('/Users/jeondogyun/Desktop/example.xlsx').readAsBytesSync();

  final excel = Excel.decodeBytes(bytes);

  var sheetName = excel.tables.keys.first;
  var sheet = excel.tables[sheetName];
  var cell = sheet?.cell(CellIndex.indexByString('D5'));
  print(cell?.value);

  String value;
  if (cell?.value is SharedString) {
    var sharedValue = cell?.value as SharedString;
    value = sharedValue.toString();
  } else {
    value = cell?.value;
  }

  runApp(MaterialApp(
    home: Column(children: [
      Text(value),
      ElevatedButton(
        onPressed: () {
          sheet?.updateCell(CellIndex.indexByString('D5'), 'new value');
          final newFileBytes = excel.encode();
          File('/Users/jeondogyun/Desktop/example.xlsx')
              .writeAsBytesSync(newFileBytes!);
        },
        child: Text('Button'),
      )
    ]),
  )); // App 구동(메인페이지)
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // 코딩하는 부분
//   }
// }

// Update
// runApp(MaterialApp(
//     home: Column(children: [
//       Text(value),
//       ElevatedButton(
//         onPressed: () {
//           sheet?.updateCell(CellIndex.indexByString('D5'), 'new value');
//           final newFileBytes = excel.encode();
//           File('/Users/jeondogyun/Desktop/example.xlsx')
//               .writeAsBytesSync(newFileBytes);
//         },
//         child: Text('Button'),
//       )
//     ]),
//   )); 