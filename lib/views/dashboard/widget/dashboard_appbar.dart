part of '../screen/dashboard_screen.dart';

class DashboardAppbar extends GetView<DashboardController>
    implements PreferredSizeWidget {
  const DashboardAppbar({Key? key, this.isDashboard = true, this.title = ""}) : super(key: key);

  final bool isDashboard;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarColor: Colors.transparent, // Make status bar transparent
          statusBarIconBrightness: Brightness.dark, // Black icons
          statusBarBrightness: Brightness.light, // For iOS (black text)
        ),
        backgroundColor: Colors.transparent,
        title: Column(
          children: [
            Sizes.height.v10,
            Padding(
              padding: EdgeInsets.only(
                  right: Dimensions.paddingSize * .2,
                  top: Dimensions.paddingSize * .1,
              ),
              child: Row(
                children: [
                  // !isDashboard ? NavProfileWidget() : ChangeLocation(),
                  !isDashboard ? TextWidget(title) : ChangeLocation(),
                  Spacer(),
                  IconButton(
                      onPressed: () {
                        Routes.notificationScreen.toNamed;
                      },
                      icon: Icon(
                        Icons.notifications_none_rounded,
                        size: Dimensions.iconSizeLarge * .9,
                      )),
                ],
              ),
            ),
          ],
        ));
  }

  Size get preferredSize =>
      Size.fromHeight(Dimensions.appBarHeight * (isDashboard ? 1.2 : 1.2));
}
