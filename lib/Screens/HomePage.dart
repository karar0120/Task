
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noon/Business_logic/cubit/App_state.dart';
import 'package:noon/Screens/Home.dart';

import '../Business_logic/cubit/App_cubit.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>HomeCubit(),
      child: BlocConsumer<HomeCubit,HomeState>(
        listener: (context,state){},
        builder: (context,state){
          var Cubit=HomeCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.grey[300],
            appBar: AppBar(
              title: Text(Cubit.text[Cubit.CurrentIndex],style: TextStyle(
                color: Colors.black,

              ),),
              backgroundColor: Colors.grey[300],
              elevation: 0.0,

            ),
              body://Center(child: Column(
             //   children: [
             //     TextButton(
             //       onPressed: (){
             //         Cubit.GetdataFormApi();
             //       },
             //       child: Text("Done"),
             //     ),
             //     TextButton(
             //       onPressed: (){
             //         Cubit.GetdataFormApi2();
             //       },
             //       child: Text("Done"),
             //     ),
             //   ],
             // )),
            //Text("${Cubit.Categories.data.length}"),
            Cubit.Pages[Cubit.CurrentIndex],
            bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.black,
              fixedColor: Colors.red,
             onTap: (index){
               Cubit.ChangeBottomNavigationBar(index);
             },
              currentIndex: Cubit.CurrentIndex,
              items: [
                BottomNavigationBarItem(
                  label:"Home"
                 ,icon: Icon(Icons.home_outlined),
                ),
                BottomNavigationBarItem(
                  label:"Cateogries"
                  ,icon: Icon(Icons.apps),
                ),
                BottomNavigationBarItem(
                  label:"Profile"
                  ,icon: Icon(Icons.person),
                ),
                BottomNavigationBarItem(
                  label:"Cart"
                  ,icon: Icon(Icons.shopping_cart),
                ),
              ],
            ),
          );
        },

      )
    );
  }
}
