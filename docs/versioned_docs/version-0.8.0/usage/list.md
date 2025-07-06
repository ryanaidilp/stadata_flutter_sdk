# List

The `list` property returns a `ListResult` class, which includes two main properties:

1. **Data Property:**

   - The `data` property contains a list of data based on the specified type. For instance, if you are fetching publications, the data will be of type `List<Publication>`.

2. **Pagination Property:**

   - The `pagination` property is an instance of the `Pagination` entity, which provides information related to pagination. It includes the following properties:
     - `page`: The current page.
     - `pages`: The total number of pages.
     - `count`: The count of data entries on the current page.
     - `perPage`: The number of entries per page.
     - `total`: The total number of data entries.

3. **Data Availability Property:**

   - The `dataAvailability` property is an enum from `DataAvailability` enum, which provides information related to data availability. It includes the following values:
     - `DataAvailability.available`: Indicating data is available.
     - `DataAvailability.listUnavailable`: Indicating the requested list not available.
     - `DataAvailability.unavailable`: Indicating the requested data not available.

To retrieve a list of models, follow these steps:

1. Create an instance of `StadataFlutter`.

2. Access the `list` getter from the instance, granting you access to various models from domains, publications, press releases, census data, and more.

3. Use the `list` method with the desired parameters. For example:

   ```dart
   // Fetch publications for a specific domain
   var publicationsResult = await StadataFlutter.instance.list.publications(domain: '7200');
   
   // Fetch census data (NEW FEATURE!)
   var censusResult = await StadataFlutter.instance.list.census();
   
   // Fetch census topics for Population Census 2020
   var topicsResult = await StadataFlutter.instance.list.censusTopics(censusID: 'sp2020');
   
   // Fetch census datasets for a specific topic
   var datasetsResult = await StadataFlutter.instance.list.censusEventDatasets(
     censusID: 'sp2020',
     topicID: 20,
   );
   ```

This call will provide you with a `ListResult` containing data of the appropriate type and pagination information for further navigation.

## Census Data Examples

The SDK now supports comprehensive census data access:

```dart
// 1. Get all available census types
final censusTypes = await StadataFlutter.instance.list.census();
print('Available census types: ${censusTypes.data.length}');

// 2. Get topics for a specific census
final topics = await StadataFlutter.instance.list.censusTopics(
  censusID: 'sp2020', // Population Census 2020
);
print('Topics available: ${topics.data.length}');

// 3. Get geographical areas for a census
final areas = await StadataFlutter.instance.list.censusEventAreas(
  censusID: 'sp2020',
);
print('Areas with data: ${areas.data.length}');

// 4. Get actual datasets
final datasets = await StadataFlutter.instance.list.censusEventDatasets(
  censusID: 'sp2020',
  topicID: 20, // Demographics topic
);
print('Available datasets: ${datasets.data.length}');
```
