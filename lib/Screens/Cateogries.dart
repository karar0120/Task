import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:noon/Business_logic/Provider/AppProvider.dart';
import 'package:noon/Business_logic/Provider/ProductsProvider.dart';
import 'package:noon/Screens/Products.dart';
import 'package:provider/provider.dart';
import '../Data/Modal/categoriesModal.dart';

class Cateogries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider()..GetdataFormApi(),
      child: Consumer<ProductProvider>(
        builder: (context, Modal, child) {
          return ConditionalBuilder(
            condition: Modal.Categories != null,
            builder: (context) => ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  if (index % 2 == 0) {
                    return BuildItem2(Modal.Categories!, context, index);
                  } else if (index % 2 != 0) {
                    return BuildItem(Modal.Categories!, context, index);
                  }
                  return Container();
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: Modal.Categories!.data!.length),
            fallback: (context) => Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget BuildItem(categories Modal, context, index) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => products(
                      ProductTypeId: Modal.data![index].productsTypeID!,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(11)),
          width: MediaQuery.of(context).size.width,
          height: 140,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${Modal.data![index].productsTypeNameEnglish!}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${Modal.data![index].productsTypeDiscription!}",
                      style: TextStyle(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 70,
              ),
              Expanded(
                child: Container(
                  height: 100,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "${Modal.data![index].productsTypeImage!}",
                        ),
                      )),
                ),
              ),
              SizedBox(
                width: 5,
              )
            ],
          ),
        ),
      ),
    );
  }

  //late AppProvider appProvider;
  Widget BuildItem2(categories Modal, context, index) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => products(
                    ProductTypeId: Modal.data![index].productsTypeID!)));
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(11)),
          width: MediaQuery.of(context).size.width,
          height: 140,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "${Modal.data![index].productsTypeImage!}",
                        ),
                      )),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${Modal.data![index].productsTypeNameEnglish!}",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${Modal.data![index].productsTypeDiscription!}",
                    style: TextStyle(),
                  ),
                ],
              ),
              SizedBox(
                width: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
