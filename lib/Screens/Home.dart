
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Business_logic/Provider/ProductsProvider.dart';
import '../Data/Modal/categoriesModal.dart';

class Home extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
        return  Container(
          child: Center(child:IconButton(
            onPressed: (){},
            icon: Icon(Icons.home,size: 50,),
          ) ,
          ),
        );
      }
  }
