part of '../screen/update_profile_screen.dart';

class InputField extends GetView<UpdateProfileController> {
  const InputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.paddingSize * .6,
            vertical: Dimensions.paddingSize * .4),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: PrimaryInputWidget(
                  controller: controller.firstNameController,
                  hintText: Strings.firstName,
                  label: Strings.firstName,
                )),
                Sizes.width.v10,
                Expanded(
                    child: PrimaryInputWidget(
                        controller: controller.lastNameController,
                        hintText: Strings.lastName,
                        label: Strings.lastName)),
              ],
            ),
            Sizes.height.v10,
            Column(
              children: [
                Obx(() => CustomDropDown<Country>(
                  label: Strings.country,
                  itemsList: controller.profileInfoModel.data.countries,
                  showSearchField: true,
                  onChanged: (value) {
                    controller.selectedCountry.value = value!;
                    controller.selectedCountryName.value = value.name;
                    controller.mobileCode.value = value.mobileCode;
                  },
                  selectMethod: controller.selectedCountryName.value.isEmpty
                      ? Strings.selectCountry.obs
                      : controller.selectedCountryName,
                )),
                Sizes.height.v10,
                Obx(() => PrimaryInputWidget(
                    controller: controller.numberController,
                    hintText: Strings.phone,
                    prefixIcon: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.paddingSize * .7,
                          vertical: Dimensions.paddingSize * .5,
                        ),
                        margin: EdgeInsets.only(
                          right: 5,
                        ),
                        decoration: BoxDecoration(
                            color: CustomColor.primary,
                            borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(Dimensions.radius))),
                        child: TextWidget(controller.mobileCode.value,
                            fontWeight: FontWeight.bold,
                            color: CustomColor.whiteColor)),
                    label: Strings.phone)),
              ],
            ),
            Sizes.height.v10,
            Row(
              children: [
                Expanded(
                    child: PrimaryInputWidget(
                  controller: controller.stateController,
                  hintText: Strings.state,
                  label: Strings.state,
                )),
                Sizes.width.v10,
                Expanded(
                    child: PrimaryInputWidget(
                        controller: controller.cityController,
                        hintText: Strings.city,
                        label: Strings.city)),
              ],
            ),
            Sizes.height.v10,
            Row(
              children: [
                Expanded(
                    child: PrimaryInputWidget(
                  controller: controller.zipController,
                  hintText: Strings.zipCode,
                  label: Strings.zipCode,
                )),
                Sizes.width.v10,
                Expanded(
                    child: PrimaryInputWidget(
                        controller: controller.addressController,
                        hintText: Strings.address,
                        label: Strings.address)),
              ],
            ),
            Sizes.height.v10,
          ],
        ));
  }
}
