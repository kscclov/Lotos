import 'package:flutter/material.dart';
import 'package:lotoss/main.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class rateCard extends StatefulWidget {

  final String rateName;
  final String picture;
  final int price;
  final String description;
  final String numClass;

  const rateCard({super.key, required this.rateName, required this.price, required this.description, required this.picture, required this.numClass});

  @override
  State<rateCard> createState() => _rateCardState();
}

class _rateCardState extends State<rateCard> {

  late String userUUId;

  @override
  void initState() {
    super.initState();
    getUserUuid();
  }

  Future<void> getUserUuid() async {
    final session = supabase.auth.currentSession;
    if (session != null && session.user != null) {
      final user = session.user!;
      userUUId = user.id;
    }
    
  }

  Future <void> inserRate() async {
      final response = await supabase
      .from('users')
      .select('rate')
      .eq('id', userUUId);
        if (response != null) {
        print('Ошибка при запросе данных: ${response}');
        return;
      }

      final List<dynamic> data = response as List<dynamic>;
      if (data.isNotEmpty && data[0]['rate'] == null) {
        await updateRate();
      } else {
        return showAlertDialog();
      }
    }

  Future<void> updateRate() async {
    final response = await supabase
    .from('users')
    .update({'rate': widget.rateName})
    .match({'id': userUUId});

    if (response.error == null) {
      print('Данные успешно обновлены в базе данных!');
    } else {
      print('Ошибка при обновлении данных: ${response.error}');
    }
  }

  void showAlertDialog() {
    AlertDialog (actions: [
      Text('У вас уже есть тариф!')
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: Offset(4.0, 4.0),
              blurRadius: 10.0,
              spreadRadius: 1.0
            ),
          ]
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: double.infinity - 10,
                      child: Image.network(widget.picture)),
                  ),
                  const SizedBox(height: 25),
                  Text(widget.rateName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(widget.description,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),                    
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SlideAction(
                          reversed: false,
                          sliderButtonIconSize: 12,
                          borderRadius: 12,
                          innerColor: const Color.fromARGB(255, 168, 114, 166),
                          outerColor: const Color.fromARGB(255, 236, 212, 234),
                          text: '           Оплатить ${widget.price} ₽',
                          sliderButtonIcon: const Icon(Icons.attach_money_sharp,
                          color: Color.fromARGB(255, 236, 212, 234)
                          ),
                          textStyle: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 168, 114, 166),
                            fontWeight: FontWeight.bold
                          ),
                          onSubmit: () async {
                            getUserUuid();
                            final response = await supabase.from('ratePays').insert([
                              {'user': userUUId, 'rate': widget.rateName, 'numClass': widget.numClass}
                            ]);
                            if (response == null) {
                              inserRate();
                            } else {
                              print('Ошибка при отправке данных: ${response.error}');
                            }
                          },
                        ),
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
