import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:beautyTn/base/extensions/extensions.dart';

import '../../../base/api/endpoint/api_endpoint.dart';
import '../../../base/api/method/request_process.dart';
import '../../../base/api/model/common_success_model.dart';
import '../../../base/widgets/custom_snackbar.dart';
import '../../../routes/routes.dart';
import '../model/profile_info_model.dart';

class UpdateProfileController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  final numberController = TextEditingController();
  final zipController = TextEditingController();
  final addressController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();

  RxString mobileCode = "+880".obs;
  RxString fullName = "".obs;

  late Rx<Country> selectedCountry;
  RxString selectedCountryName = "".obs;

  @override
  void onInit() {
    profileInfo();
    super.onInit();
  }

  /// ---------------------------

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late ProfileInfoModel _profileInfoModel;
  ProfileInfoModel get profileInfoModel => _profileInfoModel;

  Future<ProfileInfoModel?> profileInfo() async {
    return RequestProcess().request<ProfileInfoModel>(
      fromJson: ProfileInfoModel.fromJson,
      apiEndpoint: ApiEndpoint.profileInfo,
      isLoading: _isLoading,
      onSuccess: (value) {
        _profileInfoModel = value!;

        selectedCountry = _profileInfoModel.data.countries.first.obs;
        fullName.value = _profileInfoModel.data.userInfo.firstname +
            " " +
            _profileInfoModel.data.userInfo.lastname;
        firstNameController.text = _profileInfoModel.data.userInfo.firstname;
        lastNameController.text = _profileInfoModel.data.userInfo.lastname;
        numberController.text = _profileInfoModel.data.userInfo.mobile;
        zipController.text = _profileInfoModel.data.userInfo.postalCode;
        cityController.text = _profileInfoModel.data.userInfo.city;
        stateController.text = _profileInfoModel.data.userInfo.state;
        addressController.text = _profileInfoModel.data.userInfo.address;
        selectedCountryName.value = _profileInfoModel.data.userInfo.country;
        mobileCode.value = _profileInfoModel.data.userInfo.mobileCode;

        if (_profileInfoModel.data.userInfo.country.isNotEmpty) {
          selectedCountry.value = _profileInfoModel.data.countries
              .firstWhere((value) => value.name == selectedCountryName.value);
          print("TRUE -->> ");
          print(selectedCountry.value);
          print(selectedCountryName.value);
          print(mobileCode.value);
        }
      },
    );
  }

  final _isUpdateLoading = false.obs;
  bool get isUpdateLoading => _isUpdateLoading.value;

  late CommonSuccessModel _commonSuccessModel;
  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  Future<CommonSuccessModel?> updateProfile() async {
    Map<String, dynamic> inputBody = {
      'firstname': firstNameController.text,
      'lastname': lastNameController.text,
      'mobile_code': mobileCode.value,
      'mobile': numberController.text,
      'country': selectedCountryName.value,
      'city': cityController.text,
      'state': stateController.text,
      'postal_code': zipController.text,
      'address': addressController.text
    };

    return RequestProcess().request<CommonSuccessModel>(
      fromJson: CommonSuccessModel.fromJson,
      apiEndpoint: ApiEndpoint.updateProfile,
      isLoading: _isUpdateLoading,
      method: HttpMethod.POST,
      fieldList: isImagePathSet.value ? ['image'] : null,
      pathList: isImagePathSet.value ? [imagePath.value] : null,
      showSuccessMessage: true,
      body: inputBody,
      onSuccess: (value) {
        _commonSuccessModel = value!;
        Routes.navigation.toNamed;
      },
    );
  }

  // Set Image
  File? pickedFile;
  var isImagePathSet = false.obs;
  var imagePath = "".obs;

  void setImagePath(String path) {
    imagePath.value = path;
    isImagePathSet.value = true;
  }

  Future pickImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(
        source: imageSource,
        imageQuality: 40, // define image quality
        maxHeight: 600, // image height
        maxWidth: 600, // image width
      );
      if (image == null) return;
      pickedFile = File(image.path);
      setImagePath(pickedFile!.path);
    } on PlatformException catch (e) {
      CustomSnackBar.error('Error: $e');
    }
  }

    final _isDeleteLoading = false.obs;
  bool get isDeleteLoading => _isUpdateLoading.value;

  late CommonSuccessModel _deleteModel;
  CommonSuccessModel get deleteModel => _deleteModel;

  Future<CommonSuccessModel?> deleteProfile() async {
    return RequestProcess().request(
        fromJson: CommonSuccessModel.fromJson,
        apiEndpoint: ApiEndpoint.deleteAccount,
        isLoading: _isDeleteLoading,
        showErrorMessage: true,
        method: HttpMethod.POST,

        showSuccessMessage: true,
        onSuccess: (value) {
          _deleteModel = value!;
          Routes.loginScreen.offAllNamed;
        });
  }
}
