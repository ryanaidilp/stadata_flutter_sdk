import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class CensusEventsController extends GetxController
    with StateMixin<ListResult<CensusEvent>> {
  final currentPage = 1.obs;
  final totalPages = 1.obs;

  @override
  void onInit() {
    super.onInit();
    loadCensusEvents();
  }

  Future<void> loadCensusEvents() async {
    try {
      change(null, status: RxStatus.loading());
      final result = await StadataFlutter.instance.list.censusEvents();

      if (result.data.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        currentPage.value = result.pagination?.page ?? 1;
        totalPages.value = result.pagination?.pages ?? 1;
        change(result, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
