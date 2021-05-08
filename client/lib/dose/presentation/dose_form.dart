import 'package:covid_vaccination/app/presentation/components/error_dialogue.dart';
import 'package:covid_vaccination/app/presentation/components/loading_widget.dart';
import 'package:covid_vaccination/dose/data/cubit/dose_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoseForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<DoseCubit>().getDoseForUser(1);
    return Card(
      child: Container(
        // height: 740 / 2,
        width: 600,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 34),
          child: BlocConsumer<DoseCubit, DoseState>(
            listener: (context, state) {
              if (state is DoseError) {
                showErrorDialogue(context, state.message);
              }
            },
            builder: (context, state) {
              if (state is DoseLoaded) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.dose.data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '#',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                height: 1.1,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              state.dose.data[index].doseId.toString(),
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                height: 1.1,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'DOSE NO',
                          style: TextStyle(
                            color: Colors.grey[600],
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 32),
                        Text(
                          'Status:',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            height: 1.1,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          state.dose.data[index].status,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            height: 1.1,
                          ),
                        ),
                        SizedBox(height: 32),
                        Text(
                          'Date:',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            height: 1.1,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          state.dose.data[index].date,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            height: 1.1,
                          ),
                        ),
                        SizedBox(height: 32),
                      ],
                    );
                  },
                );
              }
              return LoadingWidget();
            },
          ),
        ),
      ),
    );
  }
}
