import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
 const DatePicker({Key? key}) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}


class _DatePickerState extends State<DatePicker> {
  late DateTime _lastDate;
  late int _doseInterval;
  late DateTime _nextDate;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aşı Takip Uygulaması'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Son Aşı Tarihi (dd/mm/yyyy)',
                ),
                onChanged: (value) {
                  setState(() {
                    _lastDate = DateFormat('dd/MM/yyyy').parse(value);
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Doz Aralığı (gün cinsinden)',
                ),
                onChanged: (value) {
                  setState(() {
                    _doseInterval = int.parse(value);
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_nextDate == null ? '' : 'Sonraki Aşı: ${DateFormat('dd/MM/yyyy').format(_nextDate)}'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              _nextDate = _lastDate.add(Duration(days: _doseInterval));
            });
          },
        ),
      ),
    );
  }
}
