import 'package:covid_vaccination/application/data/models/application.dart';
import 'package:covid_vaccination/application/data/models/application_list.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

class ApplicationGrid extends StatefulWidget {
  final ApplicationList applicationList;

  const ApplicationGrid(this.applicationList);

  @override
  _ApplicationGridState createState() => _ApplicationGridState();
}

class _ApplicationGridState extends State<ApplicationGrid> {
  PlutoGridStateManager stateManager;

  // void handleSelected() async {
  //   String value = '';

  //   stateManager.currentSelectingRows.forEach((element) {
  //     final cellValue = element.cells.entries.first.value.value.toString();

  //     value += 'first cell value of row: $cellValue\n';
  //   });

  //   if (value.isEmpty) {
  //     value = 'No rows are selected.';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    print(widget.applicationList);
    final applicationList = widget.applicationList.data;
    return Expanded(
      child: PlutoGrid(
        onChanged: (PlutoGridOnChangedEvent event) {
          print(event);
        },
        // onLoaded: (PlutoGridOnLoadedEvent event) {
        //   event.stateManager.setSelectingMode(PlutoGridSelectingMode.row);

        //   stateManager = event.stateManager;
        // },
        columns: [
          PlutoColumn(
            width: 80,
            title: 'ID',
            field: 'number_field',
            enableEditingMode: false,
            type: PlutoColumnType.number(readOnly: true),
          ),
          PlutoColumn(
            title: 'Name',
            field: 'name_field',
            enableEditingMode: false,
            type: PlutoColumnType.text(readOnly: true),
          ),
          PlutoColumn(
            width: 80,
            title: 'Age',
            field: 'age_field',
            enableEditingMode: false,
            type: PlutoColumnType.number(readOnly: true),
          ),
          PlutoColumn(
            title: 'Occupation',
            field: 'occupation_field',
            enableEditingMode: false,
            type: PlutoColumnType.text(readOnly: true),
          ),
          PlutoColumn(
            title: 'Location',
            field: 'location_field',
            enableEditingMode: false,
            type: PlutoColumnType.text(readOnly: true),
          ),
          PlutoColumn(
            title: 'NID',
            field: 'nid_field',
            enableEditingMode: false,
            type: PlutoColumnType.number(readOnly: true),
          ),
          PlutoColumn(
            title: 'Email',
            field: 'email_field',
            enableEditingMode: false,
            type: PlutoColumnType.text(readOnly: true),
          ),
          PlutoColumn(
            title: 'Phone No',
            field: 'phone_field',
            enableEditingMode: false,
            type: PlutoColumnType.text(readOnly: true),
          ),
          PlutoColumn(
            title: 'Date',
            field: 'date_field',
            type: PlutoColumnType.date(),
          ),
          PlutoColumn(
            title: 'Vaccination Center',
            field: 'text_field',
            type: PlutoColumnType.text(),
          ),
          PlutoColumn(
            title: 'Comment',
            field: 'admin_comment',
            type: PlutoColumnType.text(),
          ),
        ],
        rows: List.generate(
          widget.applicationList.data.length,
          (index) {
            return PlutoRow(
              cells: {
                'number_field': PlutoCell(
                  value: applicationList[index].application.applicationId,
                ),
                'name_field': PlutoCell(
                  value: applicationList[index].application.name,
                ),
                'age_field': PlutoCell(
                  value: applicationList[index].application.age,
                ),
                'occupation_field': PlutoCell(
                  value: applicationList[index].application.occupation,
                ),
                'location_field': PlutoCell(
                  value: applicationList[index].application.location,
                ),
                'nid_field': PlutoCell(
                  value: applicationList[index].application.nid,
                ),
                'email_field': PlutoCell(
                  value: applicationList[index].application.email,
                ),
                'phone_field': PlutoCell(
                  value: applicationList[index].application.phoneNo,
                ),
                'date_field': PlutoCell(
                  value: applicationList[index].application.submissionDate,
                ),
                'text_field': PlutoCell(
                  value: applicationList[index].application.vaccinationCenter,
                ),
                'admin_comment': PlutoCell(
                  value: applicationList[index].application.adminComment,
                ),
              },
            );
          },
        ),
      ),
    );
  }
}
