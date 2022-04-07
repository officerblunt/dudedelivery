import 'package:dudedelivery/post/convert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: Column(
          children: [
            FutureBuilder<List<Delivery>>(
                future: fetchDelivery(),
                builder: (context, snapshot) {
                  print(snapshot);
                  if(snapshot.hasData || snapshot.connectionState == ConnectionState.done) {
                    snapshot.data!.map((e) => Column(children: [
                      Text('${e.id}'),
                      Text('${e.amountOfSpaces}'),
                      Text(e.organisation),
                    ]));
                  }
                  return const CircularProgressIndicator();
                })
          ],
        ),
      ),
    );
  }
}
