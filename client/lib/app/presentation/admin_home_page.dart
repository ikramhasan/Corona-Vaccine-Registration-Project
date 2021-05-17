import 'package:covid_vaccination/app/presentation/components/loading_widget.dart';
import 'package:covid_vaccination/application/data/cubit/application_cubit.dart';
import 'package:covid_vaccination/application/data/models/application_list.dart';
import 'package:covid_vaccination/authentication/data/models/admin.dart';
import 'package:covid_vaccination/authentication/presentation/components/header.dart';
import 'package:covid_vaccination/dose/data/cubit/dose_cubit.dart';
import 'package:covid_vaccination/dose/data/models/dose_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pluto_grid/pluto_grid.dart';

class AdminHomePage extends StatefulWidget {
  final Admin admin;

  AdminHomePage(this.admin);

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  PlutoGridStateManager stateManager;

  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  String value = '';

  String adminStatus = 'Pending';

  String comment = '';

  List<Data> applicationList;

  Data application;

  void handleSelected() async {
    stateManager.currentSelectingRows.forEach((element) {
      final cellValue = element.cells.entries.last.value.value.toString();

      value += cellValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      endDrawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              child: Center(
                child: Text('Change Dose Status'),
              ),
            ),
            SizedBox(height: 16),
            BlocConsumer<DoseCubit, DoseState>(
              listener: (context, state) {
                if (state is DoseLoaded) {
                  setState(() {
                    state.dose.data.isEmpty
                        ? adminStatus = 'Pending'
                        : adminStatus = state.dose.data.first.status;
                  });
                }
              },
              builder: (context, state) {
                if (state is DoseLoaded) {
                  bool isEmpty = state.dose.data.isEmpty;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dose 1',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        isEmpty
                            ? Container()
                            : Text(
                                'Date',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                        isEmpty ? Container() : SizedBox(height: 8),
                        isEmpty
                            ? Container()
                            : Text(state.dose.data.first.date.substring(0, 10)),
                        isEmpty ? Container() : SizedBox(height: 8),
                        Text(
                          'Status',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        DropdownButton<String>(
                          hint: Text(adminStatus),
                          isExpanded: true,
                          items: <String>[
                            'Pending',
                            'Approved',
                            'Rejected',
                            'Vaccinated',
                          ].map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              adminStatus = value;
                            });
                          },
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Comment',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        TextFormField(
                          initialValue: application.application.adminComment,
                          maxLines: 3,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[350],
                          ),
                        ),
                        SizedBox(height: 16),
                        InkWell(
                          onTap: () async {
                            DoseEntity dose = DoseEntity(
                              userId: int.parse(value),
                              date: DateTime.now(),
                              status: adminStatus,
                              doseNo: 1,
                            );

                            await context.read<DoseCubit>().createDose(dose);
                            context
                                .read<ApplicationCubit>()
                                .getAllApplications();
                          },
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Center(
                              child: Text(
                                'Update',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return LoadingWidget();
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 244, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            SizedBox(height: 32),
            buildListHeader(context),
            SizedBox(height: 32),
            Expanded(
              child: BlocBuilder<ApplicationCubit, ApplicationState>(
                builder: (context, state) {
                  if (state is ApplicationListLoaded) {
                    applicationList = state.applicationList.data;
                    return Container(
                      child: PlutoGrid(
                        onSelected: (event) {},
                        onLoaded: (PlutoGridOnLoadedEvent event) {
                          event.stateManager
                              .setSelectingMode(PlutoGridSelectingMode.row);

                          stateManager = event.stateManager;
                        },
                        onChanged: (PlutoGridOnChangedEvent event) {},
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
                          PlutoColumn(
                            title: 'Dose 1 Status',
                            field: 'dose_stat_1',
                            type: PlutoColumnType.text(),
                            frozen: PlutoColumnFrozen.right,
                          ),
                          PlutoColumn(
                            title: 'Dose 2 Status',
                            field: 'dose_stat_2',
                            type: PlutoColumnType.text(),
                            frozen: PlutoColumnFrozen.right,
                          ),
                          PlutoColumn(
                            title: 'User id',
                            field: 'user_id',
                            type: PlutoColumnType.number(),
                          ),
                        ],
                        rows: List.generate(
                          applicationList.length,
                          (index) {
                            return PlutoRow(
                              cells: {
                                'number_field': PlutoCell(
                                  value: applicationList[index]
                                      .application
                                      .applicationId,
                                ),
                                'name_field': PlutoCell(
                                  value:
                                      applicationList[index].application.name,
                                ),
                                'age_field': PlutoCell(
                                  value: applicationList[index].application.age,
                                ),
                                'occupation_field': PlutoCell(
                                  value: applicationList[index]
                                      .application
                                      .occupation,
                                ),
                                'location_field': PlutoCell(
                                  value: applicationList[index]
                                      .application
                                      .location,
                                ),
                                'nid_field': PlutoCell(
                                  value: applicationList[index].application.nid,
                                ),
                                'email_field': PlutoCell(
                                  value:
                                      applicationList[index].application.email,
                                ),
                                'phone_field': PlutoCell(
                                  value: applicationList[index]
                                      .application
                                      .phoneNo,
                                ),
                                'date_field': PlutoCell(
                                  value: applicationList[index]
                                      .application
                                      .submissionDate,
                                ),
                                'text_field': PlutoCell(
                                  value: applicationList[index]
                                      .application
                                      .vaccinationCenter,
                                ),
                                'admin_comment': PlutoCell(
                                  value: applicationList[index]
                                      .application
                                      .adminComment,
                                ),
                                'dose_stat_1': PlutoCell(
                                  value:
                                      applicationList[index].doseList.length < 1
                                          ? 'Pending'
                                          : applicationList[index]
                                              .doseList
                                              .first
                                              .status,
                                ),
                                'dose_stat_2': PlutoCell(
                                  value:
                                      applicationList[index].doseList.length < 2
                                          ? 'Pending'
                                          : applicationList[index]
                                              .doseList
                                              .last
                                              .status,
                                ),
                                'user_id': PlutoCell(
                                  value:
                                      applicationList[index].application.userId,
                                ),
                              },
                            );
                          },
                        ),
                      ),
                    );
                  }
                  return LoadingWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildListHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Applications',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'List of all applications',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {
            handleSelected();
            if (value.isNotEmpty) {
              application = applicationList.singleWhere(
                (data) {
                  return data.application.userId == int.parse(value);
                },
              );
              print(application.application.adminComment);
              context.read<DoseCubit>().getDoseForUser(int.parse(value));
              _globalKey.currentState.openEndDrawer();
            }
          },
          child: Text('Change Status'),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(100, 60),
          ),
        ),
      ],
    );
  }
}
