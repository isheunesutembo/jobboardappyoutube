import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobboardapp/features/auth/repository/local_repository.dart';
import 'package:jobboardapp/features/resumes/controller/resume_controller.dart';
import 'package:jobboardapp/features/resumes/widgets/resume_item_widget.dart';
import 'package:jobboardapp/util/errortext.dart';
import 'package:jobboardapp/util/loader.dart';
import 'package:jobboardapp/util/route.dart';

class ResumeScreen extends ConsumerWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.read(localAuthRepositoryProvider).getUserId();
    final resume = ref.watch(gettingResumesProvider(userId.toString()));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Resumes",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.addresumescreen);
              },
              child: Text(
                "Add Resume",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
      body: resume.when(
        data: (data) {
          return RefreshIndicator(
            onRefresh:
                () => ref.refresh(
                  gettingResumesProvider(userId.toString()).future,
                ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: ListView.builder(
                  itemCount: data.length,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.resumedetailscreen,
                          arguments: data[index],
                        );
                      },
                      child: ResumeItemWidget(resumeModel: data[index]),
                    );
                  },
                ),
              ),
            ),
          );
        },
        error: (error, stackTrace) => Errortext(error: error.toString()),
        loading: () => Loader(),
      ),
    );
  }
}
