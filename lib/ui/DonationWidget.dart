import 'package:flutter/material.dart';

import 'package:storage_management_system/constants/project_colors.dart';
import 'package:storage_management_system/constants/project_measures.dart';
import 'package:storage_management_system/ui/frequently_used_widgets/ButtonWidget.dart';

const List<String> donatedItemCategories = <String>[
  'clothes',
  'electronics',
  'paper',
  'furniture',
  'other'
];
const List<String> areas = <String>[
  'Nasr City',
  'Maadi',
  '6 October',
  'Giza',
  'Haram'
];

class DonationWidget extends StatefulWidget {
  final VoidCallback onChanged;

  const DonationWidget({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<DonationWidget> createState() => _DonationWidgetState();
}

class _DonationWidgetState extends State<DonationWidget> {
  String donatedItemDropdownValue = donatedItemCategories.first;
  String areaDropdownValue = areas.first;
  @override
  String donatedItem = "clothes";
  int numOfDonatedItems = 0;

  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: medium_padding * 2),
          const Text('Donation category: '),


          Material
            (
            elevation: small_padding/5,
            shadowColor: mainBlue,
            shape: const CircleBorder(),
            child: TextButton(
              style: const ButtonStyle(
              ),
              onPressed: () {
                setState(() {
                  if ( numOfDonatedItems > 0 ) {
                    numOfDonatedItems--;
                  }
                });
              }, child: const Text('-', style: TextStyle(color: Colors.black, fontSize: medium_font_size),),
            ),
          ),


          Text('${donatedItem} : ${numOfDonatedItems} ',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: mainBlue,
              fontSize: small_font_size*1.7,
                fontWeight: FontWeight.w700,
                fontFamily: 'IBM'
            ),),

          Material
            (
            elevation: small_padding/5,
            shadowColor: mainBlue,
            shape: CircleBorder(),
            child: TextButton(
              style: const ButtonStyle(
              ),
              onPressed: () {
                setState(() {
                    numOfDonatedItems++;
                  }
                );
              }, child: const Text('+', style: TextStyle(color: Colors.black, fontSize: medium_font_size),),
            ),
          ),
//
//
//           DropdownButton<String>(
//             value: donatedItemDropdownValue,
//             icon: const Icon(Icons.keyboard_arrow_down_outlined),
//             elevation: 16,
//             style: const TextStyle(color: Colors.black54),
//             underline: Container(
//               height: 1,
//               color: underlineColor,
//             ),
//             onChanged: (String? value) {
// // This is called when the user selects an item.
//               setState(() {
//                 donatedItemDropdownValue = value!;
//               });
//             },
//             items: donatedItemCategories
//                 .map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(
//                   value,
//                 ),
// // style: TextStyle(
// //   color: Colors.cyan,
// // ),),
//               );
//             }).toList(),
//           ),

        ],
      );
}
