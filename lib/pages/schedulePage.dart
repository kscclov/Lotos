import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lotoss/main.dart';
import 'package:lotoss/widgets/cartOfClass.dart';

class schedulePage extends StatefulWidget {
  const schedulePage({super.key});

  @override
  State<schedulePage> createState() => _schedulePageState();
}

class _schedulePageState extends State<schedulePage> {
  
  late DateTime _selectedDate;
  late Future<List<Map<String, dynamic>>> _futureSchedule;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _futureSchedule = dateSearch(_selectedDate);
  }

  Future<List<Map<String, dynamic>>> dateSearch(DateTime selectedDate) async {
    final data = await supabase
        .from('schedule')
        .select('name, trainer, start_time, end_time, picture')
        .eq('date', selectedDate.toString());
    return (data as List).cast<Map<String, dynamic>>();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            _dates(),
            _dateBar(),
            Expanded(
              child: SingleChildScrollView(
                child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: _futureSchedule,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center();
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      final scheduleData = snapshot.data!;
                      if (scheduleData.isEmpty) {
                        return const Center(child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Text('Занятий пока нет!',
                          style: TextStyle(
                            fontSize: 24,
                          ),),
                        ));
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: scheduleData.length,
                          itemBuilder: (context, index) {
                            final item = scheduleData[index];
                            return cartOfClass(
                              nameClass: item['name'] ?? '',
                              trainerName: item['trainer'] ?? '',
                              startTime: item['start_time'] ?? '',
                              endTime: item['end_time'] ?? '',
                              picture: item['picture'] ?? '', 
                            );
                          },
                        );
                      }
                    }
                  },
                ),
              ),
            ),          
          ],
        ),
    );
  }
  _dateBar() {
  return Container(
         margin: EdgeInsets.only(top: 10, left: 20),
         child: DatePicker(
                  DateTime.now(),
                  height: 100,
                  width: 80,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: const Color.fromARGB(255, 105, 59, 105),
                  selectedTextColor: Colors.white,
                  dateTextStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey
                  ),
                  onDateChange: (date) {
                    setState(() {
                    _selectedDate = date;
                    _futureSchedule = dateSearch(_selectedDate);
                     });
                  },
                ),
              );
}
_dates() {
  return Container(
                  margin: EdgeInsets.only(right: 10, top: 85),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text( DateFormat.yMMMMd().format(DateTime.now()),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w400
                            ),),
                            const Text('Сегодня',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
    );
  }
}