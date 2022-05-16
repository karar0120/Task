
import 'package:flutter/material.dart';

import '../Business_logic/cubit/App_cubit.dart';
import '../Data/Modal/categoriesModal.dart';

class Home extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Container(
      child: Center(child: IconButton(
        onPressed: (){
          HomeCubit.get(context).GetdataFormApi();

        },
        icon: Icon(Icons.done,size: 50,),
      )),
    );
  }
}
