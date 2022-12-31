import 'package:flutter/material.dart';

import 'package:storage_management_system/constants/project_colors.dart';
import 'package:storage_management_system/constants/project_measures.dart';
import 'package:storage_management_system/ui/DonationWidget.dart';
import 'package:storage_management_system/ui/frequently_used_widgets/ButtonWidget.dart';

const List<String> donatedItemCategories = <String>['clothes', 'electronics', 'paper', 'furniture', 'other'];
const List<String> areas = <String>['Nasr City', 'Maadi', '6 October', 'Giza', 'Haram'];

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  String donatedItemDropdownValue = donatedItemCategories.first;
  String areaDropdownValue = areas.first;
 // final int numOfDonatedItems = 1;
  List <DonationWidget> donationsList =    List.generate(1, (index) => DonationWidget(onChanged: (){}));
  final ScrollController _scrollController = ScrollController();

  scrollToBottom() async{
    WidgetsBinding.instance!.addPostFrameCallback(
          (_) => _scrollController.jumpTo(
        _scrollController.position.maxScrollExtent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            backgroundColor: mainBlue,
            title: const Text('Make a donation'),
            centerTitle: true,
          ),

          body:
          Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
          opacity: 0.1,
            image: AssetImage("assets/images/Resala.jpeg"),
       // fit: BoxFit.cover,
      ),
      ),
      child:
                Expanded(

                  child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:   [

                      const Center(
                        child: Text("Even your smallest gifts can make a huge impact.\n"
                            "Thank you for your donations",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: mainBlue,
                            fontSize: 15,
                          ),
                        ),
                      ),



                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          const SizedBox(width: 50),

                          const Text ('Area:   '),

                          DropdownButton<String>(
                            value: areaDropdownValue,
                            icon: const Icon(Icons.keyboard_arrow_down_outlined),
                            elevation: 16,
                            style: const TextStyle(color: Colors.black54),
                            underline: Container(
                              height: 1,
                              color: underlineColor,
                            ),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                areaDropdownValue = value!;
                              });
                            },
                            items: areas.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,),
                              );
                            }).toList(),
                          ),
                        ],
                      ),


                      //address
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: medium_padding*2, vertical: 2),
                        child: TextField(
                          decoration: InputDecoration(
                            label: Text('Detailed address'),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: underlineColor),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
                            ),
                          ),
                        ),
                      ),




                      Column(
                        children:
                          List.generate(1, (index) => DonationWidget(onChanged: (){})),
                      ),


                      ButtonWidget(text: 'Submit', onClicked: () {},),





        ],
    ),

        ),
      ),
    ),
      ),
    );

  }
}

