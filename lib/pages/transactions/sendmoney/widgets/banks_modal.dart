// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o3_cards/ui/export.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../../../models/banklist.dart';
import '../../../../services/api_service.dart';
import '../../../../services/shared_service.dart';

class BanksModal extends StatefulWidget {
  const BanksModal({Key? key}) : super(key: key);

  @override
  _BanksModalState createState() => _BanksModalState();
}

class _BanksModalState extends State<BanksModal> {
  late Future<Banklist?> banks;
  String bankSelected = '';
  String bankCode = '';
  Future<Banklist?> _getBanksModel() async {
    Future<Banklist?> model = await SharedService.isBanksSaved()
        ? SharedService.bankList()
        : APIService.banklist();
    return model;
  }

  @override
  void initState() {
    super.initState();
    banks = _getBanksModel();
  }

  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    return SizedBox(
      height: heightOfScreen * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FutureBuilder<Banklist?>(
            future: banks,
            builder: ((context, snapshot) {
              return FutureBuilder<Banklist?>(
                future: banks,
                builder: (context, snapshot) {
                  var banklist = snapshot.data?.payload;
                  if (snapshot.hasData) {
                    if (snapshot.data!.payload.isEmpty) {
                      return Center(
                        child: Text(
                          'There was an error',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              color: FvColors.maintheme,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    }
                    // void searchBanks(String query) {
                    //   List<Banks>? initSuggestions = banklist;
                    //   final suggestions = initSuggestions!.where((suggestion) {
                    //     final title = suggestion.bankName.toLowerCase();
                    //     final input = query.toLowerCase();
                    //     return title.contains(input);
                    //   }).toList();
                    //   setState(
                    //     () => banklist = suggestions,
                    //   );
                    // }

                    return Column(
                      children: [
                        SizedBox(
                          height: heightOfScreen * 0.07,
                          width: widthOfScreen * 0.9,
                          child: TextField(
                            // onChanged: searchBanks,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: FvColors.maintheme,
                              ),
                              hintText: 'Search',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  color: FvColors.maintheme,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: heightOfScreen * 0.4,
                          child: ListView.builder(
                            itemCount: banklist!.length,
                            itemBuilder: (context, i) {
                              // var secondletter = banklist[i].bankName.substring(
                              //     banklist[i].bankName.indexOf(' ') + 1)[0];
                              return GestureDetector(
                                child: SizedBox(
                                  height: heightOfScreen * 0.1,
                                  width: widthOfScreen,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      SizedBox(
                                        height: heightOfScreen * 0.08,
                                        width: widthOfScreen * 0.8,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          elevation: 5,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              // CircularProfileAvatar(
                                              //   '',
                                              //   backgroundColor: Colors.grey,
                                              //   initialsText: Text(
                                              //     banklist[i].bankName[0] +
                                              //         secondletter,
                                              //     style: TextStyle(
                                              //         fontWeight:
                                              //             FontWeight.w800),
                                              //   ),
                                              //   elevation: 2,
                                              //   radius: heightOfScreen * 0.04,
                                              // ),
                                              // SizedBox(
                                              //   width: widthOfScreen * 0.001,
                                              // ),
                                              SizedBox(
                                                width: widthOfScreen * 0.5,
                                                child: Text(
                                                  banklist[i].bankName,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    bankSelected = banklist[i].bankName;
                                    bankCode = banklist[i].bankCode;
                                  });
                                  var bankFinal = [bankSelected, bankCode];

                                  Navigator.pop(context, bankFinal);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'There was an error',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: widthOfScreen * 0.03,
                            color: FvColors.maintheme,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  }
                  return SizedBox(
                    height: heightOfScreen * 0.25,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: widthOfScreen * 0.4,
                          height: heightOfScreen * 0.2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Please Wait',
                                style: GoogleFonts.lato(
                                  color: Colors.black,
                                ),
                              ),
                              JumpingDotsProgressIndicator(
                                color: Colors.black,
                                fontSize: 20.0,
                              )
                            ],
                          ),
                        )
                        // const CircularProgressIndicator(
                        //   color: FvColors.maintheme,
                        // ),
                      ],
                    ),
                  );
                },
              );
            }),
          )
        ],
      ),
    );
  }
}
