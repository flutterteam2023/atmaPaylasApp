import 'dart:io';

import 'package:atma_paylas_app/api/log.dart';
import 'package:atma_paylas_app/common_widgets/custom_filled_button.dart';
import 'package:atma_paylas_app/constants/colors/app_colors.dart';
import 'package:atma_paylas_app/repositories/user_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
@RoutePage()
class ProfileEditView extends StatefulHookConsumerWidget {
  const ProfileEditView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileEditViewState();
}
class _ProfileEditViewState extends ConsumerState<ProfileEditView> {
  
  

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
  final surnameController = useTextEditingController();
  final usernameController = useTextEditingController();
  final userLocatedCity = useTextEditingController();
  final userLocatedDistrict = useTextEditingController();
  final images = useState<File?>(null);
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        images.value=File(pickedFile.path);
      });
    }
  }


    return Scaffold(
      
      appBar: AppBar(
        centerTitle: false,
        title: Text("Profil Düzenle",
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: 32.h, left: 16.w, right: 16.w, bottom: 40.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Center(
                    child: SizedBox(
                      height: 80.r,
                      width: 80.r,
                      child: Bounceable(
                        onTap: _pickImage,
                        child:images.value==null? CircleAvatar(
                          
                        backgroundColor: Colors.white,
                        backgroundImage: UserRepository.user?.image != null
                            ? NetworkImage(UserRepository.user!.image!)
                            : null,
                        child: UserRepository.user?.image != null
                            ? null
                            : const Icon(Icons.person, color: Color(AppColors.primaryColor)),
                                  ):CircleAvatar(
                          
                        backgroundColor: Colors.white,
                        backgroundImage: FileImage(images.value!),
                        child: UserRepository.user?.image != null
                            ? null
                            : const Icon(Icons.person, color: Color(AppColors.primaryColor)),
                                  ),
                      ),
                    ),
                  ),
                  SizedBox(height: 18.h,),
                  Text('Fotoğrafı Düzenle',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(AppColors.primaryColor),
                    fontFamily: 'Rubik'
                  ),
                  )
                  
                ],
              ),
              SizedBox(height: 32.h,),
              ProfileTextfield(
                controller: nameController,
                text: 'Ad',
                hintText: UserRepository.user?.name??'',
              ),
              SizedBox(height: 24.h,),
              ProfileTextfield(
                controller: surnameController,
                text: 'Soyad',
                hintText: UserRepository.user?.surname??'',
              ),
              SizedBox(height: 24.h,),
              ProfileTextfield(
                controller: usernameController,
                text: 'Kullanıcı Adı',
                hintText: UserRepository.user?.username??'',
              ),
               SizedBox(height: 24.h,),
              ProfileTextfield(
                controller: userLocatedCity,
                text: 'İl',
                hintText: UserRepository.user?.userLocatedCity??'',
              ),
              SizedBox(height: 24.h,),
              ProfileTextfield(
                controller: userLocatedDistrict,
                text: 'Semt',
                hintText: UserRepository.user?.userLocatedDistrict??'',
              ),
              SizedBox(height: 48.h,),
              CustomFilledButton(text: 'Uygula ve Devam Et', onTap: (){
                if (images.value != null) {
                GetIt.instance<UserRepository>().editUserProfile(usernameController.value.text, nameController.value.text, surnameController.value.text, userLocatedCity.value.text, userLocatedDistrict.value.text);
                 GetIt.instance<UserRepository>().editUserProfilePhoto(images.value!);

                  
                }else{
                  GetIt.instance<UserRepository>().editUserProfile(usernameController.value.text, nameController.value.text, surnameController.value.text, userLocatedCity.value.text, userLocatedDistrict.value.text);
                }
                  UserRepository().getMyUserProfile().then((value) {
      value.fold(
        (l) {
          Log.error(l);
          UserRepository.user = null;
        },
        (r) {
          Log.success(r.runtimeType);
          UserRepository.user = r;
        },
      );
    });
                AutoRouter.of(context).back();
      
              })
            ],
          ),
        ),
      )
    );
  }
}

class ProfileTextfield extends StatelessWidget {
  const ProfileTextfield({
    super.key, required this.text, required this.hintText, this.controller,
  });
  final String text ;
  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,
    style: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Color(AppColors.primaryTextColor),
    ),
    ),
    SizedBox(height: 5.h,),
    TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: Color(AppColors.primaryTextColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(AppColors.primaryTextColor)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(AppColors.primaryTextColor)),
        ),
      
      ),
    )
      ],
    );
  }
}