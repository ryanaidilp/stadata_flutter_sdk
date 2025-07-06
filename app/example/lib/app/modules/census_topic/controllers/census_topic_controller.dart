import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class CensusTopicController extends GetxController
    with StateMixin<ListResult<CensusTopic>> {
  final Rxn<String?> selectedEvent = Rxn('sp2020');
  final currentPage = 1.obs;
  final totalPages = 1.obs;

  final isCensusLoading = false.obs;
  final isCensusError = false.obs;
  final censuses = List<CensusEvent>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    loadCensus();
    loadCensusTopics();
  }

  Future<void> loadCensus() async {
    try {
      isCensusError.value = false;
      isCensusLoading.value = true;

      final result = await StadataFlutter.instance.list.censusEvents();

      censuses.value = result.data;
    } catch (e) {
      isCensusError.value = true;
    } finally {
      isCensusLoading.value = false;
    }
  }

  Future<void> loadCensusTopics() async {
    try {
      change(null, status: RxStatus.loading());

      if (selectedEvent.value == null) {
        return change(null, status: RxStatus.error('Select valid event!'));
      }

      final result = await StadataFlutter.instance.list.censusTopics(
        censusID: selectedEvent.value!,
      );

      if (result.data.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(result, status: RxStatus.success());
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
