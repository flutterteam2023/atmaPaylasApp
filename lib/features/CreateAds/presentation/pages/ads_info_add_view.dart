// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';

import 'package:atma_paylas_app/common_widgets/auth_textfield.dart';
import 'package:atma_paylas_app/common_widgets/custom_filled_button.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/repositories/category_repository.dart';
import 'package:atma_paylas_app/repositories/feed_repository.dart';
import 'package:atma_paylas_app/routing/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class AdsInfoAddView extends StatefulHookConsumerWidget {
  const AdsInfoAddView(this.id, {super.key});
  final String? id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdsInfoAddViewState();
}
class _AdsInfoAddViewState extends ConsumerState<AdsInfoAddView> {
   
 

  @override
  Widget build(BuildContext context) {
  final share = useState(false);
    final change = useState(false);
    // ignore: cast_from_null_always_fails, cast_nullable_to_non_nullable
    final listingType = useState('');
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();
  final images = useState<List<File?>>([]);
 Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        images.value.add(File(pickedFile.path));
      });
    }
  }



    return SizedBox(
      height: MediaQuery.of(context).size.height-300.h,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 24.h, left: 16.w,bottom: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                   GetIt.instance<CategoryRepository>().categoryname!,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Rubik',
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding:  EdgeInsets.only(right: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Bounceable(
                        onTap: () {
                          if (share.value==false) {
                            share.value=true;
                            change.value=false;
                            listingType.value='free';
                            
                          }else{
                            share.value=false;
                            // ignore: unnecessary_null_comparison, unnecessary_statements
                            listingType.value!=null;
    
                          }
    
                          
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: Colors.white,
                              border: Border.all(color: const Color(AppColors.primaryColor)),),
                          child: Padding(
                            padding:  EdgeInsets.only(right: 8.w, left: 8.w, top: 10.h, bottom: 10.h),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 8.r,
                                  width: 8.r,
                                  child: Radio(
                                    value: share.value ? 1 : 0,
                                    groupValue: 1,
                                    onChanged: (value) {},
                                    activeColor: const Color(AppColors.primaryColor),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                
                                Text('Paylaşmak istiyorum',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Rubik',
                                  color: const Color(AppColors.primaryColor),
                                ),
                              
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Bounceable(
                        onTap: () {
                          if (change.value==false) {
                            change.value=true;
                            share.value=false;
                            listingType.value='tradable';
                            
                          }else{
                            change.value=false;
                            // ignore: unnecessary_null_comparison, unnecessary_statements
                            listingType.value!=null;
    
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: Colors.white,
                              border: Border.all(color: const Color(AppColors.primaryColor))),
                          child: Padding(
                            padding: EdgeInsets.only(right: 8.w, left: 8.w, top: 10.h, bottom: 10.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 8.r,
                                  width: 8.r,
                                  child: Radio(
                                    value: change.value ? 1 : 0,
                                    groupValue: 1,
                                    onChanged: (value) {},
                                    activeColor: const Color(AppColors.primaryColor),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text('Takaslamak istiyorum',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Rubik',
                                  color: const Color(AppColors.primaryColor),
                                ),
                              
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'İlan Fotoğrafları',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Rubik',
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                SizedBox(
                  height: 90.h,
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Bounceable(
                        onTap: (){
                          if (images.value.length<3) {
                            _pickImage();
                            
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('En fazla 3 fotoğraf eklenebilir')));
                          }
                        },
                        child: Container(
                          width: 105.w,
                          height: 90.h,
                          decoration:  BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5.r)),
                            border: Border.all(color:  const Color(0xffC2C2C2)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset('assets/svg/imageico.svg'),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text('Ekle',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Rubik',
                                color: const Color(AppColors.primaryTextColor),
                              ),
                            
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 90.h,
                        width: 300,
                        child: ListView.builder(
                          itemCount: images.value.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: 14.w,right: 7.w),
                              child: Stack(
                                children: [
                                  Container(
                                    width: 105.w,
                                    height: 90.h,
                                    decoration:  BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(5.r)),
                                      border: Border.all(color:  const Color(0xffC2C2C2)),
                                      
                                    ),
                                    child: Image.file(images.value[index]!,fit: BoxFit.fill,),
                                    
                                  ),
                                  Positioned(
                                    bottom: 8.h,
                                    right: 8.w,
                                    child: Bounceable(
                                      onTap: () {
                                        setState(() {
                                          images.value.removeAt(index);
                                        });
                                        
                                      },
                                      child: Container(
                                        height: 32.r,
                                        width: 32.r,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                          child: SvgPicture.asset('assets/svg/trash-outline.svg'),
                                        )
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  'İlan Detayları',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Rubik',
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(right: 16.w,top: 16.h),
                  child:  Column(
                    children: [
                       AuthTextfield(
                        controller: titleController,
                        text: 'İlan Başlığı', textInputType: TextInputType.multiline, hintText: 'Casio Saat'),
                      SizedBox(
                        height: 24.h,
                      ),
                       AuthTextfield(
                        
                        controller: descriptionController,
                        text: 'İlan Açıklaması', textInputType: TextInputType.multiline, hintText: 'Açıklama',maxLine: 5,minLine: 5,),
                      SizedBox(
                        height: 48.h,
                      ),
                      CustomFilledButton(text: 'İlanı Yayınla', onTap: (){
                        if (images.value.length<3) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('En az 3 fotoğraf eklenebilir')));
                          
                        }else{
                         GetIt.instance<FeedRepository>().addFeed(images.value[0], images.value[1], images.value[2],listingType.value=='free'?ListingTypes.free:ListingTypes.tradable , int.parse(widget.id!), titleController.value.text, descriptionController.value.text).then((value) {
                          value.fold((l) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l))), (r) => context.replaceRoute(AdsSuccessCreateRoute()));
                         });

                        }

                      })
                      
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
