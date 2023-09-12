import 'package:flutter/material.dart';
import 'package:stadata_flutter_sdk/stadata_flutter_sdk.dart';

class DomainPage extends StatefulWidget {
  const DomainPage({super.key});

  @override
  State<DomainPage> createState() => _DomainPageState();
}

class _DomainPageState extends State<DomainPage> {
  late ValueNotifier<Future<ListResult<DomainEntity>>> future;

  final TextEditingController provinceCodeCtl = TextEditingController();

  DomainType domainType = DomainType.all;

  @override
  void initState() {
    future = ValueNotifier(
      StadataFlutter.instance.list.domains(type: domainType),
    );
    super.initState();
  }

  updateFuture() {
    FocusScope.of(context).unfocus();
    future.value = StadataFlutter.instance.list.domains(
      type: domainType,
      provinceCode: provinceCodeCtl.value.text,
    );
  }

  @override
  void dispose() {
    future.dispose();
    provinceCodeCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Domain Page'),
      ),
      body: ValueListenableBuilder(
        valueListenable: future,
        builder: (context, value, child) =>
            FutureBuilder<ListResult<DomainEntity>>(
          initialData: const ListResult<DomainEntity>(data: []),
          future: value,
          builder: (context, snapshot) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Custom Param',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 8,
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    isDense: true,
                    labelText: 'Type (type) - required',
                  ),
                  value: domainType,
                  items: DomainType.values
                      .map(
                        (e) => DropdownMenuItem<DomainType>(
                          value: e,
                          child: Text('${e.name} - ${e.value}'),
                        ),
                      )
                      .toList(),
                  onChanged: (selectedType) {
                    if (selectedType == null) return;

                    setState(() {
                      domainType = selectedType;
                    });
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: provinceCodeCtl,
                  enabled: domainType == DomainType.regencyByProvince,
                  maxLength: 2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Province Code (prov) - optional',
                    helperText: 'Optional',
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: updateFuture,
                    child: const Text('Submit'),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Pagination',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 8,
                ),
                IntrinsicHeight(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          'Page : ${snapshot.requireData.pagination?.page ?? 0}',
                        ),
                        const VerticalDivider(
                          color: Colors.blueGrey,
                        ),
                        Text(
                          'Pages : ${snapshot.requireData.pagination?.pages ?? 0}',
                        ),
                        const VerticalDivider(
                          color: Colors.blueGrey,
                        ),
                        Text(
                          'Per Page : ${snapshot.requireData.pagination?.perPage ?? 0}',
                        ),
                        const VerticalDivider(
                          color: Colors.blueGrey,
                        ),
                        Text(
                          'Total : ${snapshot.requireData.pagination?.total ?? 0}',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Result',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Expanded(
                  child: Center(
                    child: switch (snapshot.connectionState) {
                      ConnectionState.waiting ||
                      ConnectionState.active =>
                        const SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(),
                        ),
                      ConnectionState.none ||
                      ConnectionState.done =>
                        ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (_, __) => const Divider(),
                          itemCount: snapshot.requireData.data.length,
                          itemBuilder: (context, index) => ListTile(
                            title: Text(
                                '${snapshot.requireData.data[index].id} - ${snapshot.requireData.data[index].name}'),
                            subtitle: SelectableText(
                              snapshot.requireData.data[index].url,
                            ),
                          ),
                        )
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
