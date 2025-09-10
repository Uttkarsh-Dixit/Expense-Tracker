import 'package:flutter/material.dart';

class Money extends StatelessWidget {
  const Money({super.key});

  @override
  Widget build(BuildContext context) {

    Widget record ({
      required int amt,
      required String where,
      required String desc,
      required TimeOfDay time,
      required bool out,
    }){
      return Card(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(padding: EdgeInsets.all(20),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(where,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  ),
                ),

                SizedBox(height: 15,),

                Text(desc,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(240,145, 145, 159)
                  ),
                ),
              ],
            ),
            ),

            Padding(padding: EdgeInsets.all(20),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(!out)
                  Text('+ $amt', style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.green
                  ),
                  )
                else
                  Text('- $amt', style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.red
                  ),
                  ),
                SizedBox(height: 10,),
                Text(time.format(context), style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(240,145, 145, 159)
                ),
                ),
              ],
            ),
            )

          ],
        ),

      );

    }
    return ListView(
      children: [
        record(
            amt: 5120,
            where: 'Shopping',
            desc: 'Buy some grocery',
            time: TimeOfDay(hour: 10, minute: 0), out: true),

        record(
            amt: 532,
            where: 'Food',
            desc: 'Arabian Hut',
            time: TimeOfDay(hour: 19, minute: 30), out: true),

        record(
            amt: 5000,
            where: 'Salary',
            desc: 'Salary for August',
            time: TimeOfDay(hour: 16, minute: 30), out: false),

        record(
            amt: 1180,
            where: 'Subscription',
            desc: 'Disney+ Annual...',
            time: TimeOfDay(hour: 10, minute: 0), out: true),

        record(
            amt: 1032,
            where: 'Fuel',
            desc: 'Kozikhode',
            time: TimeOfDay(hour: 19, minute: 30), out: true),

        record(
            amt: 532,
            where: 'Cinema',
            desc: 'Lulu Mall',
            time: TimeOfDay(hour: 19, minute: 30), out: true),
      ],
    );
  }
}