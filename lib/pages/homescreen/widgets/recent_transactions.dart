// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:o3_cards/models/transaction_list_response.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:o3_cards/ui/pallete.dart';

import '../../../services/api_service.dart';
import '../../../services/shared_service.dart';

class Recenttransactions extends StatefulWidget {
  const Recenttransactions({Key? key}) : super(key: key);

  @override
  _RecenttransactionsState createState() => _RecenttransactionsState();
}

class _RecenttransactionsState extends State<Recenttransactions> {
  late Future<TransactionlistResponse?> transactionList;

  Future<TransactionlistResponse?> _getTxnsModel() async {
    Future<TransactionlistResponse?> model = await SharedService.isTxnsSaved()
        ? SharedService.txnList()
        : APIService.userTransactions();
    return model;
  }

  @override
  void initState() {
    super.initState();
    transactionList = _getTxnsModel();
  }

  @override
  Widget build(BuildContext context) {
    var widthOfScreen = MediaQuery.of(context).size.width;
    double marginFromSafeArea = 24;
    var heightOfScreen =
        MediaQuery.of(context).size.height - marginFromSafeArea;
    return SizedBox(
      height: heightOfScreen * 0.29,
      child: FutureBuilder<TransactionlistResponse?>(
        future: transactionList,
        builder: (context, txnModel) {
          var transactions = txnModel.data?.payload;
          if (txnModel.hasData) {
            if (txnModel.data!.payload.isEmpty) {
              return Center(
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: widthOfScreen * 0.05,
                      top: heightOfScreen * 0.01,
                    ),
                    child: const Text('No recent transactions'),
                  ),
                ),
              );
            }
            return SizedBox(
              height: heightOfScreen * 0.2,
              width: widthOfScreen * 0.8,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: transactions!.length,
                      itemBuilder: (context, i) => Column(
                        children: [
                          GestureDetector(
                            child: Card(
                              elevation: 5,
                              shadowColor: Colors.grey.shade50,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SizedBox(
                                width: widthOfScreen * 0.9,
                                height: heightOfScreen * 0.1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.toll),
                                        color: Colors.white,
                                        iconSize: 15,
                                        padding: EdgeInsets.all(0),
                                        onPressed: () {},
                                      ),
                                    ),
                                    SizedBox(
                                      width: widthOfScreen * 0.45,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            (transactions[i].narration != null)
                                                ? transactions[i]
                                                    .narration
                                                    .toString()
                                                : transactions[i]
                                                    .comment
                                                    .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            DateFormat.MMMd()
                                                .add_jm()
                                                .format(
                                                  DateTime.parse(
                                                    transactions[i].createdAt,
                                                  ),
                                                )
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: widthOfScreen * 0.2,
                                      child: Text(
                                        NumberFormat.currency(
                                          name: '₦',
                                          decimalDigits: 0,
                                        ).format(
                                          double.parse(
                                            transactions[i].amount.toString(),
                                          ),
                                        ),
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                ),
                                builder: (context) {
                                  return SizedBox(
                                    height: heightOfScreen * 0.7,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: heightOfScreen * 0.05,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: heightOfScreen * 0.05,
                                              width: widthOfScreen * 0.35,
                                              child: Image.asset(
                                                "assets/CapitalLogoIcon_ImageView_46-190x110.png",
                                              ),
                                            ),
                                            SizedBox(
                                              child: Text(
                                                'Transaction Receipt',
                                                style: TextStyle(
                                                  color: FvColors.maintheme,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: heightOfScreen * 0.02,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [],
                                        ),
                                        SizedBox(
                                          height: heightOfScreen * 0.009,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: heightOfScreen * 0.009,
                                              child: FittedBox(
                                                child: Text(
                                                  'This Receipt was generated from the O3 Cards app on ' +
                                                      DateFormat.yMMMEd()
                                                          .add_jm()
                                                          .format(
                                                              DateTime.now())
                                                          .toString(),
                                                  style: TextStyle(
                                                    color: FvColors
                                                        .textview113FontColor,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: heightOfScreen * 0.009,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            DataTable(
                                              columns: [
                                                DataColumn(
                                                  label:
                                                      Text('Transaction Type'),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                    transactions[i].destination,
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                )
                                              ],
                                              rows: [
                                                DataRow(
                                                  cells: [
                                                    DataCell(
                                                      Text(
                                                        'Transaction Amount',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    DataCell(
                                                      Text(
                                                        NumberFormat.currency(
                                                          name: '₦',
                                                          decimalDigits: 0,
                                                        ).format(
                                                          double.parse(
                                                            transactions[i]
                                                                .amount
                                                                .toString(),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                DataRow(
                                                  cells: [
                                                    DataCell(
                                                      Text(
                                                        'Transaction Date',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    DataCell(
                                                      SizedBox(
                                                        width: widthOfScreen *
                                                            0.35,
                                                        child: Text(
                                                          DateFormat.yMMMEd()
                                                              .add_jm()
                                                              .format(
                                                                DateTime.parse(
                                                                  transactions[
                                                                          i]
                                                                      .createdAt,
                                                                ),
                                                              )
                                                              .toString(),
                                                          overflow: TextOverflow
                                                              .visible,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                DataRow(
                                                  cells: [
                                                    DataCell(
                                                      Text(
                                                        'Description',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    DataCell(
                                                      SizedBox(
                                                        width: widthOfScreen *
                                                            0.35,
                                                        child: Text(
                                                          (transactions[i]
                                                                      .narration !=
                                                                  null)
                                                              ? transactions[i]
                                                                  .narration
                                                                  .toString()
                                                              : transactions[i]
                                                                  .comment
                                                                  .toString(),
                                                          overflow: TextOverflow.visible,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                DataRow(
                                                  cells: [
                                                    DataCell(
                                                      Text(
                                                        'Reference',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    DataCell(
                                                      SizedBox(
                                                        width:
                                                            widthOfScreen * 0.4,
                                                        child: Text(
                                                          transactions[i].txref,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                // DataRow(
                                                //   cells: [
                                                //     DataCell(
                                                //       Text(
                                                //         'Transaction Status',
                                                //         style: TextStyle(
                                                //           fontWeight:
                                                //               FontWeight.w600,
                                                //         ),
                                                //       ),
                                                //     ),
                                                //     DataCell(
                                                //       SizedBox(
                                                //         width:
                                                //             widthOfScreen * 0.4,
                                                //         child: Text(
                                                //           transactions[i]
                                                //               .status,
                                                //         ),
                                                //       ),
                                                //     )
                                                //   ],
                                                // )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: 5,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (txnModel.hasError) {
            return Center(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: widthOfScreen * 0.05,
                    top: heightOfScreen * 0.01,
                  ),
                  child: const Text('Failed to get transactions'),
                ),
              ),
            );
          }
          return Column(
            children: [
              SizedBox(
                height: heightOfScreen * 0.1,
              ),
              SizedBox(
                width: widthOfScreen * 0.2,
                height: heightOfScreen * 0.04,
                child: FittedBox(
                  child: SpinKitSpinningLines(
                    color: FvColors.maintheme,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
