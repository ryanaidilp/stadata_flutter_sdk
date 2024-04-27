# View

In addition to the `list` property, `StadataFlutter` also provides the `view` property, which allows you to retrieve detailed information about a specific model. For instance, if you want to view the details of a publication, follow these steps:

1. **Create an Instance of StadataFlutter:**

   - Begin by creating an instance of `StadataFlutter`.

2. **Access the `view` Getter:**

   - Access the `view` getter from the instance, granting you access to different models from domains, publications, press releases, and more.

3. **Use the `view` Method with Required Parameters:**

   - Utilize the `view` method, specifying the required parameters. For example:

   ```dart
   var result = await StadataFlutter.instance.view.publication(
     id: 'a78f4d4f1c3548600cffcd29',
     domain: '7200'
   );
   ```

By following these steps, you can seamlessly retrieve detailed information about specific models using the BPS Web API. Whether you need to access lists or in-depth details, `StadataFlutter` provides the tools to help you accomplish your goals efficiently.
