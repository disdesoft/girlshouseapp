import 'package:flutter/material.dart';

void main() => runApp(const LicorDetail());

class LicorDetail extends StatefulWidget {
  const LicorDetail({super.key});

  @override
  State<LicorDetail> createState() => _LicorDetailState();
}

class _LicorDetailState extends State<LicorDetail> {
  List<String> images = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTIZccfNPnqalhrWev-Xo7uBhkor57_rKbkw&usqp=CAU",
    "https://wallpaperaccess.com/full/2637581.jpg"
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
           const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Mas cerca de los bojaquenses!",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15.0,
                color: Colors.white,
              ),
            ),
          ),
           PageView.builder(
            itemCount: 2,
            pageSnapping: true,
            itemBuilder: (context,pagePosition){
            return Container(
              margin: const EdgeInsets.all(10),
              child: Image.network(images[pagePosition]));
          }),
          const Text('prueba', style: TextStyle(color: Colors.white, fontSize: 50),),
          
        ],
      ),
    );
  }
}