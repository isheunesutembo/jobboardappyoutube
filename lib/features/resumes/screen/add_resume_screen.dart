import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobboardapp/features/auth/repository/local_repository.dart';
import 'package:jobboardapp/features/resumes/controller/resume_controller.dart';

class AddResumeScreen extends ConsumerStatefulWidget {
  const AddResumeScreen({super.key});

  @override
  ConsumerState<AddResumeScreen> createState() => _AddResumeScreenState();
}

class _AddResumeScreenState extends ConsumerState<AddResumeScreen> {
  @override

  File? _selectedFile;
  String? _title;

  Future<void>_pickFile()async{
    FilePickerResult? result=await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf']
    );

    if(result!=null){
      setState(() {
        _selectedFile=File(result.files.single.path!);
      });
    }
  }
  Widget build(BuildContext context) {
    final userId=ref.watch(localAuthRepositoryProvider).getUserId();
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Resume",
        style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
      ),
      body:SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              enableSuggestions: true,
              keyboardType: TextInputType.text,
              onChanged: (value){
                _title=value;
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                hintText: 'Resume Title',
                hintStyle: const TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.abc,
                color: Colors.black,size: 20,),
                alignLabelWithHint: true
              ),
              validator: ((value){
                if(value!.isEmpty){
                  return "Enter Resume Title";
                }
                return null;
              }),
            ),
            _selectedFile!=null?
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("Selected file:${_selectedFile!.path}"),),
            ):
             Center(child: Text("No File Selected"),),

             _selectedFile!=null?
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Center(
                child: SizedBox(
                  width: 400,
                  height: 60,
                  child: ElevatedButton(onPressed: (){
                    ref.read(resumeControllerProvider.notifier)
                    .uploadResume(_selectedFile!, _title.toString(), userId.toString(), context);
               
                  },style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ), child: Text("Upload Resume")),
                  ),
               ),
             ):Padding(
               padding: const EdgeInsets.all(8.0),
               child: Center(
                child: SizedBox(
                  width: 400,
                  height: 60,
                  child: ElevatedButton(onPressed: (){
               _pickFile();
                  },style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ), child: Text("Pick CV or Resume")),
                  ),
               ),
             )

          ],
        ),
      ) ,
    );
  }
}