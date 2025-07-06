import 'package:get/get.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class CensusDataController extends GetxController
    with StateMixin<ListResult<CensusData>> {
  final Rxn<String?> selectedEvent = Rxn(null);
  final Rxn<int?> selectedTopic = Rxn(null);
  final Rxn<String?> selectedCensusArea = Rxn(null);
  final Rxn<String?> selectedDataset = Rxn(null);

  final isCensusLoading = false.obs;
  final isCensusTopicLoading = false.obs;
  final isCensusAreaLoading = false.obs;
  final isCensusDatasetLoading = false.obs;
  final isCensusError = false.obs;
  final isCensusTopicError = false.obs;
  final isCensusAreaError = false.obs;
  final isCensusDatasetError = false.obs;

  final censuses = List<CensusEvent>.empty(growable: true).obs;
  final censusTopics = List<CensusTopic>.empty(growable: true).obs;
  final censusAreas = List<CensusArea>.empty(growable: true).obs;
  final censusDatasets = List<CensusDataset>.empty(growable: true).obs;

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

  Future<void> loadCensusAreas() async {
    try {
      isCensusAreaLoading.value = true;
      isCensusAreaError.value = false;

      final result = await StadataFlutter.instance.list.censusEventAreas(
        censusID: selectedEvent.value ?? '',
      );

      censusAreas.value = result.data;
    } catch (e) {
      isCensusAreaError.value = true;
    } finally {
      isCensusAreaLoading.value = false;
    }
  }

  Future<void> loadCensusDatasets() async {
    try {
      isCensusDatasetLoading.value = true;
      isCensusDatasetError.value = false;

      final result = await StadataFlutter.instance.list.censusEventDatasets(
        topicID: selectedTopic.value!,
        censusID: selectedEvent.value!,
      );

      censusDatasets.value = result.data;
    } catch (e) {
      isCensusDatasetError.value = true;
    } finally {
      isCensusDatasetLoading.value = false;
    }
  }

  Future<void> loadCensusData() async {
    try {
      change(null, status: RxStatus.loading());

      if (selectedEvent.value == null) {
        return change(null, status: RxStatus.error('Select valid event!'));
      }

      if (selectedCensusArea.value == null) {
        return change(
          null,
          status: RxStatus.error('Select valid census area!'),
        );
      }

      if (selectedDataset.value == null) {
        return change(null, status: RxStatus.error('Select valid dataset!'));
      }

      final result = await StadataFlutter.instance.list.censusData(
        censusID: selectedEvent.value!,
        censusAreaID: selectedCensusArea.value!,
        datasetID: selectedDataset.value!,
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
    selectedCensusArea.value = null;
    selectedDataset.value = null;
    censusTopics.clear();
    censusAreas.clear();
    censusDatasets.clear();
    loadCensusTopic();
    loadCensusAreas();
  }

  void onTopicChanged(int? selectedTopic) {
    if (selectedTopic == null) return;

    this.selectedTopic.value = selectedTopic;
    selectedDataset.value = null;
    censusDatasets.clear();
    loadCensusDatasets();
  }

  void onCensusAreaChanged(String? selectedCensusArea) {
    if (selectedCensusArea == null) return;

    this.selectedCensusArea.value = selectedCensusArea;
  }

  void onDatasetChanged(String? selectedDataset) {
    if (selectedDataset == null) return;

    this.selectedDataset.value = selectedDataset;
  }

  void onSubmitPressed() {
    loadCensusData();
  }
}
