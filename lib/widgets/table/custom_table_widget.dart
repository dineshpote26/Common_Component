/*
import 'package:common_jds_flutter/common/app_colors.dart';
import 'package:common_jds_flutter/common/constants.dart';
import 'package:common_jds_flutter/widgets/checkbox/checkbox_widget.dart';
import 'package:common_jds_flutter/widgets/custom_text/custom_text.dart';
import 'package:common_jds_flutter/widgets/hover/hover_widget.dart';
import 'package:common_jds_flutter/widgets/table/sorting_arrow_widget.dart';
import 'package:flutter/material.dart';

enum SortingOrder { asc, desc }

class TableHeaderItem {
  double width;
  String id;
  String? description;
  bool isDragged;
  double newWidth;
  bool centerText;

  TableHeaderItem({
    this.width = 200,
    required this.id,
    this.description,
    this.isDragged = false,
    this.centerText = false,
  }) : newWidth = width;

  @override
  bool operator ==(covariant TableHeaderItem other) => other.id == id;
}

class CustomTable extends StatefulWidget {
  final List<DataRow> rows;
  final double headingRowHeight;
  final double dataRowHeight;
  final List<TableHeaderItem> tableHeaderList;
  final Widget? columnHeaderCheckBoxWidget;
  final bool showCheckBox;
  final double? minWidth;
  final double? height;
  final List<TableHeaderItem>? headerListForSortingIcon;
  final Function(TableHeaderItem, SortingOrder)? onSortingWidgetTap;
  final TableHeaderItem? selectedSortingColumn;
  final EdgeInsets? headerPadding;
  final EdgeInsets headerTextPadding;
  final bool? resizableColumn;
  final bool? showVerticalBorder;
  final MaterialStateProperty<Color?>? tableHeaderColor;
  final Color? headerTextColor;
  final Widget? columnResizeWidget;
  final Alignment resizeWidgetAlignment;
  final Function? onRowCheckBoxTap;
  final Function? onHeaderCheckBoxTap;
  final double checkBoxColumnWidth;

  const CustomTable({
    Key? key,
    required this.rows,
    this.dataRowHeight = 40,
    this.headingRowHeight = 40,
    required this.tableHeaderList,
    this.columnHeaderCheckBoxWidget,
    this.showCheckBox = false,
    this.minWidth,
    this.headerListForSortingIcon,
    this.onSortingWidgetTap,
    this.selectedSortingColumn,
    this.headerPadding =
        const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
    this.headerTextPadding = EdgeInsets.zero,
    this.resizableColumn = true,
    this.showVerticalBorder = true,
    this.tableHeaderColor,
    this.headerTextColor,
    this.height,
    this.columnResizeWidget,
    this.resizeWidgetAlignment = Alignment.centerRight,
    this.onRowCheckBoxTap,
    this.onHeaderCheckBoxTap,
    this.checkBoxColumnWidth = 100,
  }) : super(key: key);

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  final verticalScrollController = ScrollController();
  final horizontalScrollController = ScrollController();
  double initX = 0;
  double increment = 0;
  final List<TableHeaderItem> newTableHeaderList = [];
  final List<TableHeaderItem> newTableHeaderListForSortingIcon = [];
  final List<DataRow> newRowsList = [];
  bool allRowsSelected = false;
  int selectedRowsCount = 0;

  getTableWidth() {
    double tableWidth = 0;
    for (TableHeaderItem element in widget.tableHeaderList) {
      tableWidth += element.newWidth;
    }
    if (widget.showCheckBox) {
      tableWidth += widget.checkBoxColumnWidth + 1;
    }
    return tableWidth;
  }

  getTableHeight() {
    return (widget.rows.length * widget.dataRowHeight) +
        widget.headingRowHeight;
  }

  insertCheckboxInRows(DataRow row, bool value) {
    row.cells.insert(
      0,
      DataCell(
        Center(
          child: CustomCheckbox(
            onChanged: (bool value) {
              if (widget.onRowCheckBoxTap != null) {
                onRowSelected(value);
              }
            },
            value: value,
          ),
        ),
      ),
    );
  }

  selectDeselectAllRows(bool value) {
    for (DataRow row in newRowsList) {
      row.cells.removeAt(0);
      insertCheckboxInRows(row, value);
    }
  }

  onRowSelected(bool value) {
    if (widget.onRowCheckBoxTap != null) {
      widget.onRowCheckBoxTap!(value);
      if (value) {
        selectedRowsCount += 1;
      } else {
        selectedRowsCount -= 1;
      }
      if (selectedRowsCount == 0 || selectedRowsCount < newRowsList.length) {
        allRowsSelected = false;
      }
      if (selectedRowsCount == newRowsList.length) {
        allRowsSelected = true;
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    newTableHeaderList.addAll(widget.tableHeaderList);
    if (widget.showCheckBox) {
      newTableHeaderList.insert(
        0,
        TableHeaderItem(
          width: widget.checkBoxColumnWidth,
          id: Constants.checkboxLabel,
          description: Constants.checkboxLabel,
        ),
      );
    }
    newTableHeaderListForSortingIcon.addAll(widget.tableHeaderList);
    if (widget.headerListForSortingIcon == null) {
      newTableHeaderListForSortingIcon.addAll(widget.tableHeaderList);
      if (widget.showCheckBox) {
        newTableHeaderListForSortingIcon.removeAt(0);
      }
    }
    newRowsList.addAll(widget.rows);
    if (widget.showCheckBox) {
      for (DataRow row in newRowsList) {
        insertCheckboxInRows(row, false);
      }
    }
  }

  SortingOrder columnSortOrder = SortingOrder.desc;

  @override
  Widget build(BuildContext context) {
    double minWidth = getTableWidth();
    double minTableWidth =
        minWidth + increment > minWidth ? minWidth + increment : minWidth;

    return SizedBox(
      height: widget.height ?? getTableHeight(),
      child: DataTable2(
        minWidth: widget.minWidth ?? minTableWidth,
        headingRowColor: widget.tableHeaderColor ??
            MaterialStateProperty.all(AppColors.kPrimaryColor.withOpacity(0.5)),
        headingRowHeight: widget.headingRowHeight,
        dataRowHeight: widget.dataRowHeight,
        showCheckboxColumn: false,
        dividerThickness: 1,
        columnSpacing: 0,
        horizontalMargin: 0,
        border: TableBorder(
          verticalInside: widget.showVerticalBorder == true
              ? const BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                  color: AppColors.FFE0E0E0,
                )
              : BorderSide.none,
          horizontalInside: const BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: AppColors.FFE0E0E0,
          ),
          bottom: const BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: AppColors.FFE0E0E0,
          ),
        ),
        rows: newRowsList,
        columns: List.generate(
          newTableHeaderList.length,
          (index) {
            double columnFixedWidth = newTableHeaderList[index].newWidth >
                    newTableHeaderList[index].width
                ? newTableHeaderList[index].newWidth
                : newTableHeaderList[index].width;
            bool showColumnHeaderCheckBoxWidget =
                index == 0 && widget.showCheckBox;
            return DataColumn2(
              fixedWidth: columnFixedWidth,
              label: showColumnHeaderCheckBoxWidget
                  ? Center(
                      child: widget.columnHeaderCheckBoxWidget ??
                          CustomCheckbox(
                            onChanged: (bool value) {
                              if (widget.onHeaderCheckBoxTap != null) {
                                widget.onHeaderCheckBoxTap!(value);
                                allRowsSelected = value;
                                selectDeselectAllRows(value);
                                if (value) {
                                  selectedRowsCount = newRowsList.length;
                                } else {
                                  selectedRowsCount = 0;
                                }
                                setState(() {});
                              }
                            },
                            value: allRowsSelected,
                          ),
                    )
                  : OnHover(
                      builder: (isHovered) {
                        return Stack(
                          alignment: widget.resizeWidgetAlignment,
                          children: [
                            Container(
                              padding: widget.headerPadding,
                              width: newTableHeaderList[index].newWidth,
                              constraints: BoxConstraints(
                                  minWidth: newTableHeaderList[index].width),
                              child: Row(
                                mainAxisAlignment:
                                    newTableHeaderList[index].centerText
                                        ? MainAxisAlignment.center
                                        : MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: widget.headerTextPadding,
                                    child: CustomText(
                                      text: newTableHeaderList[index]
                                                  .description ==
                                              Constants.checkboxLabel
                                          ? " "
                                          : newTableHeaderList[index]
                                              .description,
                                      color: widget.headerTextColor,
                                    ),
                                  ),
                                  if (newTableHeaderListForSortingIcon.contains(
                                              newTableHeaderList[index]) ==
                                          true &&
                                      (isHovered ||
                                          widget.selectedSortingColumn ==
                                              newTableHeaderList[index]))
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: SortingArrowWidget(
                                        onTap: () {
                                          if (widget.selectedSortingColumn ==
                                              newTableHeaderList[index]) {
                                            if (columnSortOrder ==
                                                SortingOrder.asc) {
                                              columnSortOrder =
                                                  SortingOrder.desc;
                                            } else {
                                              columnSortOrder =
                                                  SortingOrder.asc;
                                            }
                                          } else {
                                            columnSortOrder = SortingOrder.desc;
                                          }
                                          if (widget.onSortingWidgetTap !=
                                              null) {
                                            widget.onSortingWidgetTap!(
                                                newTableHeaderList[index],
                                                columnSortOrder);
                                          }
                                          setState(() {});
                                        },
                                        isTapped:
                                            widget.selectedSortingColumn ==
                                                newTableHeaderList[index],
                                        order: widget.selectedSortingColumn ==
                                                newTableHeaderList[index]
                                            ? columnSortOrder
                                            : SortingOrder.desc,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            if (widget.resizableColumn == false)
                              Positioned(
                                // top: 0,
                                // right: 0,
                                child: GestureDetector(
                                  onPanStart: (details) {
                                    newTableHeaderList[index].isDragged = true;
                                    setState(() {
                                      initX = details.globalPosition.dx;
                                    });
                                  },
                                  onPanUpdate: (details) {
                                    increment =
                                        details.globalPosition.dx - initX;
                                    newTableHeaderList[index].newWidth =
                                        newTableHeaderList[index].width +
                                            increment;
                                    setState(() {});
                                  },
                                  child: widget.columnResizeWidget ??
                                      OnHover(builder: (isHovered) {
                                        return Container(
                                          width: 10,
                                          height: widget.headingRowHeight,
                                          color: isHovered
                                              ? AppColors.kPrimaryColor
                                              : Colors.transparent,
                                        );
                                      }),
                                ),
                              )
                          ],
                        );
                      },
                    ),
            );
          },
        ),
      ),
    );
  }
}
*/
