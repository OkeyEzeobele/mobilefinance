// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:o3_cards/models/transactionListResponse.dart';
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
                          Card(
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
                                    width: widthOfScreen * 0.3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          (transactions[i].comment != null)
                                              ? transactions[i]
                                                  .comment
                                                  .toString()
                                              : transactions[i]
                                                  .destination
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
                                    width: 90,
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
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
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
