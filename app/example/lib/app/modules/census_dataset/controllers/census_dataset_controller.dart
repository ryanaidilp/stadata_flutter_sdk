import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class CensusDatasetController extends GetxController
    with StateMixin<ListResult<CensusDataset>> {
  final Rxn<String?> selectedEvent = Rxn(null);
  final Rxn<int?> selectedTopic = Rxn(null);

  final currentPage = 1.obs;
  final totalPages = 1.obs;
  final isCensusLoading = false.obs;
  final isCensusTopicLoading = false.obs;
  final isCensusError = false.obs;
  final isCensusTopicError = false.obs;

  final censuses = List<CensusEvent>.empty(growable: true).obs;
  final censusTopics = List<CensusTopic>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
    loadCensus();
  }

  Future<void> loadCensus() async {
    try {
      isCensusLoading.value = true;
      isCensusError.value = false;

      final result = await StadataFlutter.instance.list.censusEvents();

      censuses.value = result.data;
    } catch (e) {
      isCensusError.value = true;
    } finally {
      isCensusLoading.value = false;
    }
  }

  Future<void> loadCensusTopic() async {
    try {
      isCensusTopicLoading.value = true;
      isCensusTopicError.value = false;

      final result = await StadataFlutter.instance.list.censusTopics(
        censusID: selectedEvent.value ?? '',
      );

      censusTopics.value = result.data;
    } catch (e) {
      isCensusTopicError.value = true;
    } finally {
      isCensusTopicLoading.value = false;
    }
  }

  Future<void> loadCensusDataset() async {
    try {
      change(null, status: RxStatus.loading());

      if (selectedEvent.value == null) {
        return change(null, status: RxStatus.error('Select valid event!'));
      }

      if (selectedTopic.value == null) {
        return change(null, status: RxStatus.error('Select valid topic!'));
      }

      final result = await StadataFlutter.instance.list.censusEventDatasets(
        topicID: selectedTopic.value!,
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

  void onEventChanged(String? selectedEvent) {
    if (selectedEvent == null) return;

    this.selectedEvent.value = selectedEvent;
    selectedTopic.value = null;
    censusTopics.clear();
    loadCensusTopic();
  }

  void onTopicChanged(int? selectedTopic) {
    if (selectedTopic == null) return;

    this.selectedTopic.value = selectedTopic;
  }

  void onSubmitPressed() {
    loadCensusDataset();
  }
}
