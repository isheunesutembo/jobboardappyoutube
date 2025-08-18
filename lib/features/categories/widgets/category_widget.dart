import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' ;
import 'package:jobboardapp/features/categories/controller/category_controller.dart';
import 'package:jobboardapp/features/categories/models/category_model.dart';
import 'package:jobboardapp/util/errortext.dart';
import 'package:jobboardapp/util/loader.dart';

class CategoryWidget extends ConsumerWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final categories=ref.watch(getJobCategoriesProvider);
    return categories.when(data: (data){
      return SizedBox(height: 120,
      child: ListView.builder(shrinkWrap: true,scrollDirection: Axis.horizontal,itemCount: data.length,itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                radius: 40,
                child: Image.network(data[index].fullProfileImagePath,height: 40,width: 40,),
              ),
              Text(data[index].title.toString(),style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),)
            ],
          ),
        );
      }),);


    }, error:(error,stackTrace)=>Errortext(error: error.toString()), loading: ()=>Loader());
  }
}