// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noon/Business_logic/Provider/AppProvider.dart';

import 'package:noon/Data/Modal/products.dart';
import 'package:provider/provider.dart';

class products extends StatefulWidget {
  String ProductTypeId;

  products({
    Key? key,
    required this.ProductTypeId,
  }) : super(key: key);

  @override
  State<products> createState() => _productsState();
}

class _productsState extends State<products> {
  @override
  List<String> name = [
    "All",
    "Man shose",
    "Woman shose",
    "Children",
  ];
  bool isSort = false;
  bool isSortReverse = false;
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          AppProvider()..PostData(ProductId: widget.ProductTypeId),
      child: Consumer<AppProvider>(
        builder: (context, Modal, child) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: PreferredSize(
                child: getAppbar(context),
                preferredSize: Size.fromHeight(120),
              ),
              body: ConditionalBuilder(
                condition: Modal.Product != null,
                builder: (context) => Container(
                  color: Colors.grey[300],
                  child: GridView.count(
                    reverse: false,
                    crossAxisCount: 2,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    childAspectRatio: 1 / 1.35,
                    children:
                        List.generate(Modal.Product!.data!.length, (index) {
                      if (isSort == true ) {
                        Modal.Sorts();
                        return BuildGrideView(Modal.SortData![index], index);
                      } else if (isSortReverse == true) {
                        Modal.SortsReversed();
                        return BuildGrideView(
                            Modal.SortReversedData![index], index);
                      } else if (isSort == false && isSortReverse == false) {
                        return BuildGrideView(
                            Modal.Product!.data![index], index);
                      }
                      return BuildGrideView(Modal.Product!.data![index], index);
                    }),
                  ),
                ),
                fallback: (context) => Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
              ));
        },
      ),
    );
  }

  Widget BuildGrideView(Data Modal, index) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: Image(
                    width: 150,
                    height: 150,
                    image: NetworkImage("${Modal.productsSecondImage}"),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 7,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 22,
                ),
                Text(
                  "(${Modal.productRate})",
                  style: TextStyle(fontSize: 11),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${Modal.productTotalRates}",
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "     ${Modal.productsName} ",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.3,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${Modal.productsOfferPrice} \$',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 14,
                      height: 1.3,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '${Modal.productsPrice} \$',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.3,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getAppbar(context) {
    return Column(
      children: [
        AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Products",
                style: TextStyle(color: Colors.black),
              ),
              Text(
                "1  Item",
                style: TextStyle(color: Colors.grey, fontSize: 13),
              )
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context, builder: (builder) => Sort());
                },
                icon: Icon(
                  Icons.sort,
                  color: Colors.red,
                )),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          width: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  children: List.generate(name.length, (index) {
                return Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border(),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "${name[index]}",
                            style: TextStyle(color: Colors.black),
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                );
              })),
            ),
          ),
        )
      ],
    );
  }

  Widget Sort() {
    return ChangeNotifierProvider(
      create: (context) =>
          AppProvider()..PostData(ProductId: widget.ProductTypeId),
      child: Consumer<AppProvider>(
        builder: (context, Modal, child) {
          return ConditionalBuilder(
            condition: Modal.Product != null,
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setstate) {
                  return Container(
                      color: Colors.white,
                      height: 350,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sort By",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.cancel,
                                      size: 50,
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Popular Item ",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                  ),
                                ),
                                Radio(
                                    activeColor: Colors.black,
                                    value: "Popular Item",
                                    groupValue: Modal.sort,
                                    onChanged: (String? val) {
                                      setstate(() {
                                        Modal.sort = val;
                                      });
                                    })
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Price Low To High ",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                  ),
                                ),
                                Radio(
                                    activeColor: Colors.black,
                                    value: "Price Low To High ",
                                    groupValue: Modal.sort,
                                    onChanged: (String? val) {
                                      setstate(() {
                                        Modal.sort = val;
                                      });
                                      if (isSort != true) {
                                        setState(() {
                                          isSortReverse = false;
                                          isSort = true;
                                        });
                                      }
                                    })
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Price High To Low ",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                  ),
                                ),
                                Radio(
                                    activeColor: Colors.black,
                                    value: "Price High To Low",
                                    groupValue: Modal.sort,
                                    onChanged: (String? val) {
                                      setstate(() {
                                        Modal.sort = val;
                                      });
                                      if (isSortReverse==false) {

                                        setState(() {
                                          isSort = false;
                                          isSortReverse = true;
                                        });
                                      }
                                    })
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Rating High To Low ",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                  ),
                                ),
                                Radio(
                                    activeColor: Colors.black,
                                    value: "Rating High To Low ",
                                    groupValue: Modal.sort,
                                    onChanged: (String? val) {
                                      setstate(() {
                                        Modal.sort = val;
                                      });
                                    })
                              ],
                            ),
                          ],
                        ),
                      ));
                },
              );
            },
            fallback: (context) => Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            )),
          );
          //
        },
      ),
    );
  }
}
