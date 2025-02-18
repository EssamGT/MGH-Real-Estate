import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mgh/componets/mgh_button.dart';
import 'package:mgh/state/cubit/app_logic.dart';
import 'package:mgh/state/cubit/app_state.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImagePiker extends StatefulWidget {
  const ImagePiker({super.key});

  @override
  State<ImagePiker> createState() => _ImagePikerState();
}

class _ImagePikerState extends State<ImagePiker> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppLogic, AppState>(
      listener: (context, state) {
        // TODO: Implement listener
      },
      builder: (context, state) {
        var cubit = AppLogic.get(context);

        return cubit.images.isEmpty
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 100,
                  child: FittedBox(
                    child: MaterialButton(
                      onPressed: () async {
                        await cubit.getImage();
                      },
                      child: const Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 100,
                      ),
                    ),
                  ),
                ),
              )
            : Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: ReorderableListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: cubit.images.length,
                      onReorder: (oldIndex, newIndex) {
                        setState(() {
                          if (newIndex > oldIndex) {
                            newIndex -= 1;
                          }
                          final item = cubit.images.removeAt(oldIndex);
                          cubit.images.insert(newIndex, item);
                        });
                      },
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          key: ValueKey(cubit.images[
                              index]), // Unique key for ReorderableListView
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Scaffold(
                                  backgroundColor: Colors.black,
                                  appBar: AppBar(
                                    backgroundColor: Colors.black,
                                    leading: IconButton(
                                      icon: const Icon(
                                        Icons.arrow_back_ios_sharp,
                                        color: Colors.white,
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ),
                                  body: Center(
                                    child: PhotoViewGallery.builder(
                                      itemCount: cubit.images.length,
                                      builder: (context, index) {
                                        return PhotoViewGalleryPageOptions(
                                          imageProvider:
                                              FileImage(cubit.images[index]),
                                          minScale:
                                              PhotoViewComputedScale.contained,
                                          maxScale:
                                              PhotoViewComputedScale.covered *
                                                  3,
                                          filterQuality: FilterQuality.high,
                                        );
                                      },
                                      pageController:
                                          PageController(initialPage: index),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 3, vertical: 8),
                            child: Stack(
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: const BoxDecoration(
                                    border: Border.fromBorderSide(BorderSide(
                                      width: 2,
                                      color: Colors.black,
                                    )),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      cubit.images[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        cubit.images.removeAt(index);
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  MghButton(
                    title: 'Add Another Photo',
                    on_press: () async {
                      await cubit.getImage();
                      setState(() {});
                    },
                    color: Colors.black,
                  ),
                ],
              );
      },
    );
  }
}
