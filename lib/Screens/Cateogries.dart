import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noon/Business_logic/cubit/App_cubit.dart';
import 'package:noon/Business_logic/cubit/App_state.dart';
import 'package:noon/Data/Modal/products.dart';
import 'package:noon/Screens/Products.dart';

import '../Data/Modal/categoriesModal.dart';

class Cateogries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..GetdataFormApi(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var Cubit = HomeCubit.get(context);
          return ConditionalBuilder(
            condition: state is! GetDataLoadingState,
            builder: (context) => ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  if (index % 2 == 0) {
                    return BuildItem2(Cubit.Categories, context, index);
                  } else if (index % 2 != 0) {
                    return BuildItem(Cubit.Categories, context, index);
                  }
                  return Container();
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemCount: Cubit.Categories.data!.length),
            fallback: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  Widget BuildItem(categories Modal, context, index) {
    return InkWell(
      onTap: () {
        HomeCubit.get(context)
            .PostData(ProductId: Modal.data![index].productsTypeID!);
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
              Align(
                // alignment: Alignment.,
                child: Padding(
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

  Widget BuildItem2(categories Modal, context, index) {
    return InkWell(
      onTap: () {
        HomeCubit.get(context)
            .PostData(ProductId: Modal.data![index].productsTypeID.toString());
        print(Modal.data![index].productsTypeID.toString());
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    products(ProductTypeId: Modal.data![index].productsTypeID!)));
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
              Align(
                // alignment: Alignment.,
                child: Padding(
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
