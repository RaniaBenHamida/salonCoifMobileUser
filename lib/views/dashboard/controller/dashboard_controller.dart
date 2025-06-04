import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:beautyTn/views/dashboard/model/dashboard_model.dart';
import 'package:beautyTn/views/navigation/controller/navigation_controller.dart';

import '../../../base/api/endpoint/api_endpoint.dart';
import '../../../base/api/method/request_process.dart';
import '../model/home_model.dart';
import '../model/parlour_info_model.dart';
import '../model/parlour_search_model.dart';

class DashboardController extends GetxController {
  RxInt currentIndex = 0.obs;
  late Rx<Area> selectedLocation;
  RxString selectedLocationName = "".obs;
  final totalTrx = 0.obs;
  final onlineTrx = 0.obs;
  final cashPayment = 0.obs;
  final totalAmount = "".obs;

  @override
  void onInit() {
    bannerProcess();
    parlourInfo();
    dashboardProcess();
    super.onInit();
  }

  /// -------------------------------------
  /// 
    final _isDashboardLoading = false.obs;
  bool get isDashboardLoading => _isDashboardLoading.value;

  late DashboardModel _dashboardModel;
  DashboardModel get dashboardModel => _dashboardModel;

  Future<DashboardModel?> dashboardProcess() async {
    return RequestProcess().request<DashboardModel>(
      fromJson: DashboardModel.fromJson,
      apiEndpoint: ApiEndpoint.dashboard,
      isLoading: _isDashboardLoading,
      onSuccess: (value) {
        _dashboardModel = value!;
        _setData();
      },
    );
  }

    _setData() {
    totalTrx.value = _dashboardModel.data.totalTransactions;
    onlineTrx.value = _dashboardModel.data.totalOnlineTransactions;
    cashPayment.value = _dashboardModel.data.totalCashTransactions;
    totalAmount.value = _dashboardModel.data.totalTransactionsAmount.toString();

    debugPrint(
        "----reerer---------- ------- --- ${totalTrx.value} ${onlineTrx.value} ${cashPayment.value} ${totalAmount.value} ------- ---- -- --- - - -");
  }

  /// 
  /// 

  final _isisBannerLoadingLoading = false.obs;
  bool get isisBannerLoadingLoading => _isisBannerLoadingLoading.value;

  late HomeModel _homeModel;
  HomeModel get homeModel => _homeModel;

  Future<HomeModel?> bannerProcess() async {
    return RequestProcess().request<HomeModel>(
      fromJson: HomeModel.fromJson,
      apiEndpoint: ApiEndpoint.bannerUrl,
      isLoading: _isisBannerLoadingLoading,
      onSuccess: (value) {
        _homeModel = value!;

      },
    );
  }



  /// -------------------------------------
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  late ParlourListInfo _parlourListInfo;
  ParlourListInfo get parlourListInfo => _parlourListInfo;

  RxList<ParlourList> parlorList = <ParlourList>[].obs;

  Future<ParlourListInfo?> parlourInfo() async {
    isSearched.value = false;
    return RequestProcess().request<ParlourListInfo>(
      fromJson: ParlourListInfo.fromJson,
      apiEndpoint: ApiEndpoint.parlourInfo,
      isLoading: _isLoading,
      onSuccess: (value) {
        _parlourListInfo = value!;

        Get.find<NavigationController>().selectedIndex.value = 0;

        parlorList.clear();
        parlorList.addAll(_parlourListInfo.data.parlourList);

        selectedLocation = _parlourListInfo.data.area.first.obs;
        // selectedLocationName.value = _parlourListInfo.data.area.first.name;
        selectedLocationName.value = "";
        searchController.text = "";
      },
    );
  }

  /// -------------------------------------
  final searchController = TextEditingController();
  RxBool isSearched = false.obs;
  final _isSearchLoading = false.obs;
  bool get isSearchLoading => _isSearchLoading.value;

  late ParlourSearchModel _parlourSearchModel;
  ParlourSearchModel get parlourSearchModel => _parlourSearchModel;

  Future<ParlourSearchModel?> searchParlour() async {
    Get.find<NavigationController>().selectedIndex.value = 1;

    Map<String, dynamic> inputBody = {
      'area': (selectedLocationName.value == "" || selectedLocationName.value == "All Area") ? "" : selectedLocation.value.id,
      'name': searchController.text,
    };

    return RequestProcess().request<ParlourSearchModel>(
      fromJson: ParlourSearchModel.fromJson,
      apiEndpoint: ApiEndpoint.searchParlourInfo,
      isLoading: _isSearchLoading,
      method: HttpMethod.POST,
      body: inputBody,
      onError: (value){
        parlorList.clear();
      },
      onSuccess: (value) {
        _parlourSearchModel = value!;

        isSearched.value = true;

        parlorList.clear();
        parlorList.addAll(_parlourSearchModel.data);
      },
    );
  }
}
