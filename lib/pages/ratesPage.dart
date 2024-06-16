import 'package:flutter/material.dart';
import 'package:lotoss/main.dart';
import 'package:lotoss/widgets/rateCard.dart';
class ratesPage extends StatefulWidget {
  const ratesPage({super.key});

  @override
  State<ratesPage> createState() => _ratesPageState();
}

class _ratesPageState extends State<ratesPage> {

  late Future<List<Map<String, dynamic>>> _futureSchedule;

  @override
  void initState() {
    super.initState();
    _futureSchedule = dateSearch(DateTime.now());
  }

  Future<List<Map<String, dynamic>>> dateSearch(DateTime selectedDate) async {
    final data = await supabase
        .from('rates')
        .select('rateName, description, price, picture, numClass');
    return (data as List).cast<Map<String, dynamic>>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _futureSchedule,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final List<Map<String, dynamic>> rates = snapshot.data!;
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10, top: 85),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.0),
                        child: const Text(
                          'Тарифы',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: rates.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final rate = rates[index];
                      return rateCard(
                        rateName: rate['rateName'],
                        price: rate['price'],
                        description: rate['description'],
                        picture: rate['picture'], 
                        numClass: rate[('numClass')],
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}