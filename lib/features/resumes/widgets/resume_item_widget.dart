import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobboardapp/features/resumes/controller/resume_controller.dart';
import 'package:jobboardapp/features/resumes/model/resume_model.dart';

class ResumeItemWidget extends ConsumerWidget {
  ResumeModel resumeModel;
  ResumeItemWidget({super.key,required this.resumeModel});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Card(
      color: Colors.white,
      child: SizedBox(
        height: 113,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
         ClipRRect(borderRadius: BorderRadius.circular(10),
         child: Image.asset('assets/images/pdficon.png',
         height: 60,width: 60,fit: BoxFit.fill,),),
         Text(resumeModel.title??"",
         style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.black
         ),),
         GestureDetector(
          onTap: (){
            ref.read(resumeControllerProvider.notifier)
            .deleteResume(context, resumeModel.id.toString());
          },
           child: Image.asset("assets/images/deleteicon.png",
           height: 35,width: 35,),
         )
        ],),
      ),
    );
  }
}