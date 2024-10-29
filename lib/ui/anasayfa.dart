import 'package:btk_hackathon/data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Coin> _data = List.from(
    coins,
  );

  bool _isSortAsc = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: SizedBox.expand(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
              columns: _createColumns(),
              rows: _createRows(),
            ),
          ),
        ),
      ),
    );
  }

  List<DataColumn> _createColumns() {
    return [
      const DataColumn(
        label: Text('Id'),
      ),
      DataColumn(
        label: const Text('Name'),
        onSort: (columnIndex, _) {
          setState(
                () {
              if (_isSortAsc) {
                _data.sort(
                      (a, b) => a.name.compareTo(
                    b.name,
                  ),
                );
              } else {
                _data.sort(
                      (a, b) => b.name.compareTo(
                    a.name,
                  ),
                );
              }
              _isSortAsc = !_isSortAsc;
            },
          );
        },
      ),
      const DataColumn(
        label: Text('Chain'),
      ),
      DataColumn(
        label: const Text('Price'),
        onSort: (columnIndex, _) {
          setState(
                () {
              if (_isSortAsc) {
                _data.sort(
                      (a, b) => a.price.compareTo(
                    b.price,
                  ),
                );
              } else {
                _data.sort(
                      (a, b) => b.price.compareTo(
                    a.price,
                  ),
                );
              }
              _isSortAsc = !_isSortAsc;
            },
          );
        },
      ),
      DataColumn(
        label: const Text(
          '24H Change',
        ),
        onSort: (columnIndex, _) {
          setState(
                () {
              if (_isSortAsc) {
                _data.sort(
                      (a, b) => a.change24h.compareTo(
                    b.change24h,
                  ),
                );
              } else {
                _data.sort(
                      (a, b) => b.change24h.compareTo(
                    a.change24h,
                  ),
                );
              }
              _isSortAsc = !_isSortAsc;
            },
          );
        },
      )
    ];
  }

  List<DataRow> _createRows() {
    return _data.map((c) {
      return DataRow(
        cells: [
          DataCell(
            Text(
              c.id.toString(),
            ),
          ),
          DataCell(
            Text(
              c.name,
            ),
          ),
          DataCell(
            Text(
              c.chainName,
            ),
          ),
          DataCell(
            Text(
              c.price.toString(),
            ),
          ),
          DataCell(
            Text(
              c.change24h.toString(),
              style: TextStyle(
                color: c.change24h >= 0 ? Colors.green : Colors.red,
              ),
            ),
          ),
        ],
      );
    }).toList();
  }
}
