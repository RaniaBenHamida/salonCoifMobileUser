part of 'booking_detail_screen.dart';

class BookingDetailMobileScreen extends GetView<BookingDetailController> {
  const BookingDetailMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            color: Get.isDarkMode ? CustomColor.blackColor : CustomColor.whiteColor,
          ),

          SalonImage(),
          ListView(
            children: [
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .245,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSize * .2,
                    vertical: Dimensions.paddingSize * .4),
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSize * .8,
                    vertical: Dimensions.paddingSize * .6),
                decoration: BoxDecoration(
                    color: CustomColor.whiteColor,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(Dimensions.radius * 2))),
                child: Column(
                  children: [
                    ParlourInformation(), ServiceInformation(), ScheduleInformation(), PaymentInformation(),
                  ],
                ),
              )
            ],
          ),

          BackButtonWidget()

        ],
      ),
    );
  }
}