// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noon/Business_logic/cubit/App_cubit.dart';
import 'package:noon/Business_logic/cubit/App_state.dart';
import 'package:noon/Data/Modal/products.dart';

class products extends StatefulWidget {
  String ProductTypeId;

  products({
    Key ?key,
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
  bool revers = false;

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit()..PostData(ProductId: widget.ProductTypeId),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              child: getAppbar(context),
              preferredSize: Size.fromHeight(120),
            ),
            body: ConditionalBuilder(
              condition: state is! PostDataLoadingState,
              builder: (context) => Container(
                color: Colors.grey[300],
                child: GridView.count(
                  reverse: revers,
                  crossAxisCount: 2,
                  mainAxisSpacing: 1,
                  crossAxisSpacing: 1,
                  childAspectRatio: 1 / 1.25,
                  children: List.generate(
                      HomeCubit.get(context).Product.data!.length, (index) {
                    return BuildGrideView(
                        HomeCubit.get(context).Product, index);
                  }),
                ),
              ),
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget BuildGrideView(product Modal, index) {
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
                    image: NetworkImage(
                        "${Modal.data![index].productsSecondImage}"),
                    fit: BoxFit.cover,
                    //width: double.infinity,
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
                  "(${Modal.data![index].productRate})",
                  style: TextStyle(fontSize: 11),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${Modal.data![index].productTotalRates}",
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "     ${Modal.data![index].productsName} ",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.3,
                ),
              ),
            ),
            Row(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${Modal.data![index].productsOfferPrice} E',
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
                  '${Modal.data![index].productsPrice} E',
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
    return Container(
        color: Colors.white,
        height: 250,
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
                        size: 28,
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
                  Icon(
                    Icons.check_circle,
                    size: 28,
                    color: Colors.grey,
                  ),
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
                  Icon(
                    Icons.check_circle,
                    size: 28,
                    color: Colors.grey,
                  ),
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
                  Icon(
                    Icons.check_circle,
                    size: 28,
                    color: Colors.grey,
                  ),
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
                  Icon(
                    Icons.check_circle,
                    size: 28,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
