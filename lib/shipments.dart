import 'package:dudedelivery/post/convert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'models/delivery.dart';

class Shipments extends StatefulWidget {
  const Shipments({Key? key}) : super(key: key);

  @override
  _ShipmentsState createState() => _ShipmentsState();
}

class _ShipmentsState extends State<Shipments> {
  late Future<List<Delivery>> futureDelivery;

  @override
  void initState() {
    super.initState();
    // futureDelivery = fetchDelivery();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF161615),
        centerTitle: true,
        title: Text(
          'Доставки',
          style: kMainHeading.copyWith(color: Colors.white, fontSize: 20.0),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<Delivery>>(
                future: fetchDelivery(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                      shrinkWrap: true,
                      children: [
                        ...snapshot.requireData.map<Widget>(
                          (e) => Column(
                            children: [
                              Text('Номер доставки: ${e.id}'),
                              Text('Количество мест: ${e.amountOfSpaces}'),
                              Text('Название огранизации: ${e.organisation}'),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
