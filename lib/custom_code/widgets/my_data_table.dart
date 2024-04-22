// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class MyDataTable extends StatefulWidget {
  const MyDataTable({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<MyDataTable> createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
  List<String> data = [
    "Row 1",
    "Row 2",
    "Row 3",
    "Row 4",
    "Row 5",
    "Row 6",
    "Row 7",
    // Add more data as needed
  ];

  int currentPage = 1;
  int rowsPerPage = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                width: 150,
                decoration: BoxDecoration(),
                child: Column(
                  children: [
                    Text(
                      'Item Details',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 150,
                decoration: BoxDecoration(),
                child: Column(
                  children: [
                    Text(
                      'Item Category',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 120,
                decoration: BoxDecoration(),
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Text(
                        'UoM',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                decoration: BoxDecoration(),
                child: Column(
                  children: [
                    Text(
                      'Required Qty',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
                decoration: BoxDecoration(),
                child: Column(
                  children: [
                    Text(
                      'Amount',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                      ),
                    ),
                  ],
                ),
              ),
              // Add more containers for other headers
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columns: [
              DataColumn(label: Text("Column 1")),
              DataColumn(label: Text("Column 2")),
              // Add more DataColumn widgets as needed
            ],
            rows: _buildRows(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: currentPage > 1 ? _previousPage : null,
              child: Text("Previous"),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: currentPage < _totalPages() ? _nextPage : null,
              child: Text("Next"),
            ),
          ],
        ),
      ],
    );
  }

  List<DataRow> _buildRows() {
    int startIndex = (currentPage - 1) * rowsPerPage;
    int endIndex = currentPage * rowsPerPage;
    endIndex = endIndex > data.length ? data.length : endIndex;

    List<DataRow> rows = [];
    for (int i = startIndex; i < endIndex; i++) {
      rows.add(DataRow(cells: [
        DataCell(Text(data[i])),
        DataCell(Text("Value")),
        // Add more DataCell widgets as needed
      ]));
    }
    return rows;
  }

  int _totalPages() {
    return (data.length / rowsPerPage).ceil();
  }

  void _nextPage() {
    setState(() {
      currentPage++;
    });
  }

  void _previousPage() {
    setState(() {
      currentPage--;
    });
  }
}
