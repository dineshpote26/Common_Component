/*
import 'package:common_jds_flutter/common/styles/dimens.dart';
import 'package:common_jds_flutter/widgets/custom_text/custom_text.dart';
import 'package:common_jds_flutter/widgets/table/custom_table_widget.dart';
import 'package:common_jds_flutter_example/common/widget_story_ui.dart';
import 'package:common_jds_flutter_example/modules/table/data/table_widget_properties.dart';
import 'package:flutter/material.dart';

class CustomTableWidgetPage extends StatefulWidget {
  const CustomTableWidgetPage({Key? key}) : super(key: key);

  @override
  State<CustomTableWidgetPage> createState() => _CustomTableWidgetPageState();
}

class _CustomTableWidgetPageState extends State<CustomTableWidgetPage> {
  TableHeaderItem selectedSortingColumnLabel = TableHeaderItem(
    id: "Header 0",
    description: "Header 0",
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.symmetric(
                vertical: Dimens.size64, horizontal: Dimens.size32),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  WidgetStory(
                    title: CustomTableWidgetProperties.pageDetail.title,
                    description:
                        CustomTableWidgetProperties.pageDetail.description,
                    code: CustomTableWidgetProperties.pageDetail.code ?? '',
                    classPropertiesData:
                        CustomTableWidgetProperties.classPropertiesData,
                    widget: SizedBox(
                      height: 500,
                      child: CustomTable(
                        rows: List.generate(
                          20,
                          (index) => DataRow(
                            cells: List.generate(
                              8,
                              (index1) => DataCell(
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: CustomText(
                                    text: "Cell $index",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        headingRowHeight: 50,
                        dataRowHeight: 40,
                        resizableColumn: false,
                        tableHeaderList: List.generate(
                          8,
                          (index) => TableHeaderItem(
                            id: "Header $index",
                            description: "Header $index",
                          ),
                        ),
                        selectedSortingColumn: selectedSortingColumnLabel,
                        onSortingWidgetTap: (item, order) {
                          selectedSortingColumnLabel = item;
                          setState(() {});
                        },
                        showCheckBox: true,
                        onHeaderCheckBoxTap: (value) {
                          debugPrint("onHeaderCheckBoxTap $value");
                        },
                        onRowCheckBoxTap: (value) {
                          debugPrint("onRowCheckBoxTap $value");
                        },
                      ),
                    ),
                  ),
                ])));
  }
}
*/
