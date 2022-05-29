import 'package:flutter/material.dart';
import '../../ui/export.dart';

class Homescreen5 extends StatefulWidget {
  const Homescreen5({Key? key}) : super(key: key);

  @override
  _Homescreen5State createState() => _Homescreen5State();
}

class _Homescreen5State extends State<Homescreen5> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: FvColors.screen5Background,
        body: SingleChildScrollView(
          child: Column(children: [
            // ignore: prefer_const_constructors
            Align(
              alignment: Alignment.topLeft,
              child: const Padding(
                  padding: EdgeInsets.only(left: 40, top: 53),
                  child: Text(
                    "How are you?",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                      color: FvColors.textview70FontColor,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 339, top: 7),
                  child: Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 8, top: 8),
                                child: Container(
                                    width: 49,
                                    height: 49,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0, top: 0),
                                              child: Container(
                                                  width: 49,
                                                  height: 49,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 0,
                                                                  top: 0),
                                                          child: SizedBox(
                                                            height: 24,
                                                            width: 24,
                                                            child: Image.asset(
                                                                "assets/frame_ImageView_155-24x24.png"),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ))),
                                        ),
                                      ],
                                    ))),
                          ),
                        ],
                      ))),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 181, top: 39),
                  child: Container(
                      width: 173,
                      height: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(181.35592651367188),
                        color: FvColors
                            .container58Backgroundcontainer72Backgroundcontainer73Backgroundcontainer141Backgroundcontainer142Backgroundcontainer146Backgroundcontainer147Backgroundcontainer161Backgroundcontainer162Background,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(),
                          ),
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding:
                                    EdgeInsets.only(left: 16, top: 11),
                                child: Text(
                                  "Add Credit Card",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: FvColors
                                        .screen2Backgroundscreen3Backgroundcontainer84Backgroundcontainer85Backgroundcontainer138Backgroundcontainer167Background,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 122, top: 14),
                              child: SizedBox(
                                height: 11,
                                width: 11,
                                child: Image.asset(
                                    "assets/PlusIconUIA_ImageView_150-11x11.png"),
                              ),
                            ),
                          ),
                        ],
                      ))),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 36, top: 35),
                  child: Text(
                    "Adaeze,",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 30,
                      color: FvColors.textview50FontColor,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 0, top: 24),
                  child: Container(
                      width: 968,
                      height: 223,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 655, top: 12),
                                child: Container(
                                    width: 313,
                                    height: 198,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          17.848459243774414),
                                      color: FvColors
                                          .screen2Backgroundscreen3Backgroundcontainer84Backgroundcontainer85Backgroundcontainer138Backgroundcontainer167Background,
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 107, top: 0),
                                            child: SizedBox(
                                              height: 205,
                                              width: 345,
                                              child: Image.asset(
                                                  "assets/CapitalLogoSoloIcon_ImageView_86-345x205.png"),
                                            ),
                                          ),
                                        ),
                                        const Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 55, top: 76),
                                              child: Text(
                                                "4687 3424 8732 5432",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: FvColors
                                                      .textview87FontColor,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )),
                                        ),
                                        const Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 25, top: 23),
                                              child: Text(
                                                "Paris Adaeze",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  color: FvColors
                                                      .textview88FontColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )),
                                        ),
                                        const Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 24, top: 135),
                                              child: Text(
                                                "\$3542.56",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: FvColors
                                                      .textview87FontColor,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              )),
                                        ),
                                        const Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 26, top: 127),
                                              child: Text(
                                                "BALANCE",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 6,
                                                  color: FvColors
                                                      .textview88FontColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )),
                                        ),
                                        const Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 144, top: 127),
                                              child: Text(
                                                "VALID TILL",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 6,
                                                  color: FvColors
                                                      .textview91FontColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 229, top: 133),
                                            child: SizedBox(
                                              height: 23,
                                              width: 38,
                                              child: Image.asset(
                                                  "assets/CapitalLogoSoloIcon_ImageView_92-38x23.png"),
                                            ),
                                          ),
                                        ),
                                        const Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 145, top: 139),
                                              child: Text(
                                                "11/24",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: FvColors
                                                      .textview87FontColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 256, top: 23),
                                              child: Container(
                                                  width: 36,
                                                  height: 36,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 0,
                                                                    top: 0),
                                                            child: Container(
                                                                width: 36,
                                                                height: 36,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0),
                                                                ),
                                                                child: Stack(
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topLeft,
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            left:
                                                                                0,
                                                                            top:
                                                                                0),
                                                                        child:
                                                                            SizedBox(
                                                                          height:
                                                                              11,
                                                                          width:
                                                                              11,
                                                                          child:
                                                                              Image.asset("assets/elementequal_ImageView_96-11x11.png"),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ))),
                                                      ),
                                                    ],
                                                  ))),
                                        ),
                                      ],
                                    ))),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 312, top: 0),
                                child: Container(
                                    width: 355,
                                    height: 223,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          20.40023422241211),
                                      color: FvColors
                                          .screen1Backgroundcontainer19Backgroundcontainer20Backgroundcontainer42Backgroundcontainer43Backgroundcontainer44Backgroundscreen4Backgroundcontainer57Backgroundcontainer97Backgroundcontainer110Background,
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 122, top: 0),
                                            child: SizedBox(
                                              height: 235,
                                              width: 394,
                                              child: Image.asset(
                                                  "assets/CapitalLogoSoloIcon_ImageView_99-394x235.png"),
                                            ),
                                          ),
                                        ),
                                        const Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 63, top: 87),
                                              child: Text(
                                                "4687 3424 8732 5432",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: FvColors
                                                      .button14FontColor,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )),
                                        ),
                                        const Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 28, top: 26),
                                              child: Text(
                                                "Paris Adaeze",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: FvColors
                                                      .button14FontColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )),
                                        ),
                                        const Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 27, top: 154),
                                              child: Text(
                                                "\$3542.56",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 21,
                                                  color: FvColors
                                                      .textview87FontColor,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              )),
                                        ),
                                        const Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 29, top: 145),
                                              child: Text(
                                                "BALANCE",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 7,
                                                  color: FvColors
                                                      .button14FontColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )),
                                        ),
                                        const Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 165, top: 145),
                                              child: Text(
                                                "VALID TILL",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 7,
                                                  color: FvColors
                                                      .button14FontColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 262, top: 153),
                                            child: SizedBox(
                                              height: 26,
                                              width: 44,
                                              child: Image.asset(
                                                  "assets/CapitalLogoSoloIcon_ImageView_105-44x26.png"),
                                            ),
                                          ),
                                        ),
                                        const Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 166, top: 159),
                                              child: Text(
                                                "11/24",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: FvColors
                                                      .textview87FontColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 293, top: 26),
                                              child: Container(
                                                  width: 38,
                                                  height: 38,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 0,
                                                                    top: 0),
                                                            child: Container(
                                                                width: 38,
                                                                height: 38,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0),
                                                                ),
                                                                child: Stack(
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topLeft,
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            left:
                                                                                0,
                                                                            top:
                                                                                0),
                                                                        child:
                                                                            SizedBox(
                                                                          height:
                                                                              13,
                                                                          width:
                                                                              13,
                                                                          child:
                                                                              Image.asset("assets/elementequal_ImageView_109-13x13.png"),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ))),
                                                      ),
                                                    ],
                                                  ))),
                                        ),
                                      ],
                                    ))),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 8),
                                child: Container(
                                    width: 325,
                                    height: 205,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          18.57050323486328),
                                      color: FvColors
                                          .screen1Backgroundcontainer19Backgroundcontainer20Backgroundcontainer42Backgroundcontainer43Backgroundcontainer44Backgroundscreen4Backgroundcontainer57Backgroundcontainer97Backgroundcontainer110Background,
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 111, top: 0),
                                            child: SizedBox(
                                              height: 214,
                                              width: 359,
                                              child: Image.asset(
                                                  "assets/CapitalLogoSoloIcon_ImageView_112-359x214.png"),
                                            ),
                                          ),
                                        ),
                                        const Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 57, top: 79),
                                              child: Text(
                                                "4687 3424 8732 5432",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: FvColors
                                                      .textview113FontColor,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )),
                                        ),
                                        const Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 26, top: 24),
                                              child: Text(
                                                "Paris Adaeze",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  color: FvColors
                                                      .textview114FontColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )),
                                        ),
                                        const Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 25, top: 140),
                                              child: Text(
                                                "\$3542.56",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 19,
                                                  color: FvColors
                                                      .textview113FontColor,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              )),
                                        ),
                                        const Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 27, top: 132),
                                              child: Text(
                                                "BALANCE",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 7,
                                                  color: FvColors
                                                      .textview114FontColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )),
                                        ),
                                        const Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 150, top: 132),
                                              child: Text(
                                                "VALID TILL",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 7,
                                                  color: FvColors
                                                      .textview114FontColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 239, top: 139),
                                            child: SizedBox(
                                              height: 24,
                                              width: 40,
                                              child: Image.asset(
                                                  "assets/CapitalLogoSoloIcon_ImageView_118-40x24.png"),
                                            ),
                                          ),
                                        ),
                                        const Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 151, top: 145),
                                              child: Text(
                                                "11/24",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: FvColors
                                                      .textview113FontColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 267, top: 24),
                                              child: Container(
                                                  width: 37,
                                                  height: 37,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 0,
                                                                    top: 0),
                                                            child: Container(
                                                                width: 37,
                                                                height: 37,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0),
                                                                ),
                                                                child: Stack(
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topLeft,
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets.only(
                                                                            left:
                                                                                0,
                                                                            top:
                                                                                0),
                                                                        child:
                                                                            SizedBox(
                                                                          height:
                                                                              12,
                                                                          width:
                                                                              12,
                                                                          child:
                                                                              Image.asset("assets/elementequal_ImageView_122-12x12.png"),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ))),
                                                      ),
                                                    ],
                                                  ))),
                                        ),
                                      ],
                                    ))),
                          ),
                        ],
                      ))),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 178, top: 26),
                  child: Container(
                      width: 83,
                      height: 29,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 0),
                                child: Container(
                                    width: 83,
                                    height: 29,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(),
                                        ),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(),
                                        ),
                                      ],
                                    ))),
                          ),
                        ],
                      ))),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 55, top: 54),
                  child: Container(
                      width: 79,
                      height: 79,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.788473129272461),
                        color: FvColors
                            .container58Backgroundcontainer72Backgroundcontainer73Backgroundcontainer141Backgroundcontainer142Backgroundcontainer146Backgroundcontainer147Backgroundcontainer161Backgroundcontainer162Background,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, top: 12),
                                child: Container(
                                    width: 57,
                                    height: 57,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0, top: 0),
                                              child: Container(
                                                  width: 57,
                                                  height: 57,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 0,
                                                                  top: 0),
                                                          child: SizedBox(
                                                            height: 32,
                                                            width: 32,
                                                            child: Image.asset(
                                                                "assets/send_ImageView_76-32x32.png"),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ))),
                                        ),
                                      ],
                                    ))),
                          ),
                        ],
                      ))),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 221, top: 54),
                  child: Container(
                      width: 79,
                      height: 79,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.788473129272461),
                        color: FvColors
                            .container58Backgroundcontainer72Backgroundcontainer73Backgroundcontainer141Backgroundcontainer142Backgroundcontainer146Backgroundcontainer147Backgroundcontainer161Backgroundcontainer162Background,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 11, top: 12),
                                child: Container(
                                    width: 57,
                                    height: 57,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0, top: 0),
                                              child: Container(
                                                  width: 57,
                                                  height: 57,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 0,
                                                                  top: 0),
                                                          child: SizedBox(
                                                            height: 32,
                                                            width: 32,
                                                            child: Image.asset(
                                                                "assets/cardreceive_ImageView_145-32x32.png"),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ))),
                                        ),
                                      ],
                                    ))),
                          ),
                        ],
                      ))),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 138, top: 54),
                  child: Container(
                      width: 79,
                      height: 79,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.788473129272461),
                        color: FvColors
                            .container58Backgroundcontainer72Backgroundcontainer73Backgroundcontainer141Backgroundcontainer142Backgroundcontainer146Backgroundcontainer147Backgroundcontainer161Backgroundcontainer162Background,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 9, top: 9),
                                child: Container(
                                    width: 59,
                                    height: 59,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0, top: 0),
                                              child: Container(
                                                  width: 59,
                                                  height: 59,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 0,
                                                                  top: 0),
                                                          child: SizedBox(
                                                            height: 34,
                                                            width: 34,
                                                            child: Image.asset(
                                                                "assets/wallet_ImageView_165-34x34.png"),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ))),
                                        ),
                                      ],
                                    ))),
                          ),
                        ],
                      ))),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 315, top: 42),
                  child: Container(
                      width: 54,
                      height: 54,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 0),
                                child: Container(
                                    width: 54,
                                    height: 54,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0, top: 0),
                                            child: SizedBox(
                                              height: 29,
                                              width: 29,
                                              child: Image.asset(
                                                  "assets/dollarsquare_ImageView_158-29x29.png"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ))),
                          ),
                        ],
                      ))),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 146, top: 22),
                  child: Text(
                    "Payment",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 11,
                      color: FvColors.textview66FontColor,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 218, top: 14),
                  child: Text(
                    "Fund 03 Card",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 11,
                      color: FvColors.textview66FontColor,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 311, top: 14),
                  child: Text(
                    "Rewards",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 11,
                      color: FvColors.textview66FontColor,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 64, top: 14),
                  child: Text(
                    "Transfer",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 11,
                      color: FvColors.textview66FontColor,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 272, top: 39),
                  child: Text(
                    "History",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: FvColors.textview65FontColor,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 87, top: 16),
                  child: Text(
                    "Activities",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: FvColors
                          .screen2Backgroundscreen3Backgroundcontainer84Backgroundcontainer85Backgroundcontainer138Backgroundcontainer167Background,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 35, top: 20),
                  child: Container(
                      width: 368,
                      height: 219,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 1, top: 112),
                              child: SizedBox(
                                height: 82,
                                width: 164,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                      "assets/Group_ImageButton_60-164x82.png"),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 179, top: 112),
                              child: SizedBox(
                                height: 82,
                                width: 164,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                      "assets/Group_ImageButton_61-164x82.png"),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0, top: 0),
                              child: SizedBox(
                                height: 96,
                                width: 343,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Image.asset(
                                      "assets/Group_ImageButton_62-343x96.png"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ))),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 174, top: 26),
                child: SizedBox(
                  height: 77,
                  width: 77,
                  child: GestureDetector(
                    onTap: () {},
                    child:
                        Image.asset("assets/Group_ImageButton_168-77x77.png"),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 112, top: 69),
                  child: Container(
                      width: 56,
                      height: 69,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Stack(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding:
                                    EdgeInsets.only(left: 3, top: 34),
                                child: Text(
                                  "Cards",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: FvColors.textview79FontColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 0),
                                child: Container(
                                    width: 56,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0, top: 0),
                                              child: Container(
                                                  width: 56,
                                                  height: 56,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 0,
                                                                  top: 0),
                                                          child: SizedBox(
                                                            height: 31,
                                                            width: 31,
                                                            child: Image.asset(
                                                                "assets/cards_ImageView_82-31x31.png"),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ))),
                                        ),
                                      ],
                                    ))),
                          ),
                        ],
                      ))),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 279, top: 44),
                  child: Container(
                      width: 56,
                      height: 69,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Stack(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding:
                                    EdgeInsets.only(left: 5, top: 34),
                                child: Text(
                                  "Stats",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: FvColors.textview79FontColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 0),
                                child: Container(
                                    width: 56,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0, top: 0),
                                              child: Container(
                                                  width: 56,
                                                  height: 56,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 0,
                                                                  top: 0),
                                                          child: SizedBox(
                                                            height: 31,
                                                            width: 31,
                                                            child: Image.asset(
                                                                "assets/chartsquare_ImageView_127-31x31.png"),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ))),
                                        ),
                                      ],
                                    ))),
                          ),
                        ],
                      ))),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 34, top: 44),
                  child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 0),
                                child: Container(
                                    width: 56,
                                    height: 56,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0, top: 0),
                                            child: SizedBox(
                                              height: 31,
                                              width: 31,
                                              child: Image.asset(
                                                  "assets/home_ImageView_130-31x31.png"),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ))),
                          ),
                        ],
                      ))),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(left: 350, top: 29),
                  child: Container(
                      width: 54,
                      height: 67,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Stack(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding:
                                    EdgeInsets.only(left: 4, top: 32),
                                child: Text(
                                  "More",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: FvColors.textview79FontColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 0, top: 0),
                                child: Container(
                                    width: 54,
                                    height: 54,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0, top: 0),
                                              child: Container(
                                                  width: 54,
                                                  height: 54,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 0,
                                                                  top: 0),
                                                          child: SizedBox(
                                                            height: 29,
                                                            width: 29,
                                                            child: Image.asset(
                                                                "assets/category_ImageView_135-29x29.png"),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ))),
                                        ),
                                      ],
                                    ))),
                          ),
                        ],
                      ))),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 38, top: 10),
                  child: Text(
                    "Home",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 8,
                      color: FvColors
                          .screen2Backgroundscreen3Backgroundcontainer84Backgroundcontainer85Backgroundcontainer138Backgroundcontainer167Background,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(),
            ),
          ]),
        ));
  }
}
