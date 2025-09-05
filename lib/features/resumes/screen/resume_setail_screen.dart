import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:jobboardapp/features/resumes/model/resume_model.dart';

class ResumeDetailScreen extends StatelessWidget {
  const ResumeDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resume = ModalRoute.of(context)!.settings.arguments as ResumeModel;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            if (resume.fullResumePath.isNotEmpty) ...{
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.white,
                    child: PDF(
                      enableSwipe: true,
                      swipeHorizontal: true,
                      backgroundColor: Colors.white,
                    ).cachedFromUrl(resume.fullResumePath),
                  ),
                ),
              ),
            } else ...{
              const Center(child: Text("Resume Not Found")),
            },
          ],
        ),
      ),
    );
  }
}
