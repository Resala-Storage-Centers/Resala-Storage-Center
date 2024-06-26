import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:storage_management_system/constants/project_measures.dart';
import 'package:storage_management_system/data/model/employee.dart';

import '../../constants/project_colors.dart';


class EmployeeCardWidget extends StatefulWidget {
  final Employee employee;
  final VoidCallback onClicked;

  const EmployeeCardWidget({
    Key? key,
    required this.employee,
    required this.onClicked,
  }) : super(key: key);

  @override
  State<EmployeeCardWidget> createState() => _EmployeeCardWidgetState();
}

class _EmployeeCardWidgetState extends State<EmployeeCardWidget> {
  @override
  Widget build(BuildContext context) =>
      Wrap(
        children: [Stack
          (
          children: <Widget>
          [


            Align
              (
              alignment: Alignment.topCenter,
              child: SizedBox.fromSize
                (
                  size: const Size.fromHeight(172.0),
                  child: Stack
                    (
                    fit: StackFit.expand,
                    children: <Widget>
                    [

                      Container
                        (
                        margin: const EdgeInsets.only(top: medium_padding),
                        child: Material
                          (
                          elevation: small_padding,
                          borderRadius: BorderRadius.circular(small_padding),
                          shadowColor: mainOffWhite,
                          color: Colors.white,
                          child: InkWell
                            (
                            //  onTap: () {},
                            child: Padding
                              (
                              padding: const EdgeInsets.all(medium_padding),
                              child: Column
                                (
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>
                                [

                                  /// Title and rating
                                  Column
                                    (
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: <Widget>
                                    [


                                      Text('${widget.employee.name}',
                                        style: const TextStyle(
                                            color: mainBlue,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'IBM',
                                            fontSize: medium_font_size),
                                      ),
                                      const SizedBox(height: medium_padding),

                                      Text('ID: ${widget.employee.id}',
                                          style: const TextStyle(
                                              color: mainBlue,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'IBM')),
                                      const SizedBox(height: small_padding),


                                      Row
                                        (
                                        mainAxisAlignment: MainAxisAlignment
                                            .start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: <Widget>
                                        [

                                          RatingBarIndicator(
                                            rating: widget.employee.rank,
                                            itemCount: 5,
                                            itemSize: 30.0,
                                            physics: const BouncingScrollPhysics(),
                                            itemBuilder: (context, _) =>
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                          ),


                                          Text('${this.widget.employee.rank}',
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: large_font_size)),
                                          // const Icon(
                                          //     Icons.star, color: Colors.black,
                                          //     size: medium_padding),
                                        ],
                                      ),
                                    ],
                                  ),


                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 100,
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              opacity: 0.75,
                              image: AssetImage("assets/images/Resala.jpeg"),
                              // fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      // CircleAvatar(
                      //   backgroundColor: Colors.greenAccent[400],
                      //   radius: 100,
                      //   child: Image.asset("assets/images/Resala.jpeg", ),
                      // ),


                      /// Item image
                      Align
                        (
                        alignment: Alignment.topRight,
                        child: Padding
                          (
                          padding: const EdgeInsets.only(
                              right: small_padding * 1.5),
                          child: SizedBox.fromSize
                            (
                            size: const Size.fromRadius(54.0),
                            child: CircleAvatar(
                              foregroundColor: Colors.red,
                              backgroundImage: AssetImage(
                                  widget.employee.profilePicUrl),
                            ),

                            // Material
                            //   (
                            //   elevation: small_padding,
                            //   shadowColor: mainBlue,
                            //   borderRadius: BorderRadius.
                            //   shape:  const CircleBorder(side: BorderSide( )),
                            //   child: Image.asset('assets/images/Mohamed2.png'),
                            // ),
                          ),
                        ),
                      ),

                    ],

                  )
              ),
            ),

            /// Review
          ],
        ),
  ],
      );
}