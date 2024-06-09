import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/controllers/scan/cubit/scan_cubit.dart';
import 'package:timeago/timeago.dart' as timeago;

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History of scans'),
      ),
      body: SizedBox(
          width: double.infinity,
          child: BlocListener<ScanCubit, ScanState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            child: BlocBuilder<ScanCubit, ScanState>(
              builder: (context, state) {
                return RefreshIndicator(
                  onRefresh: ()async => context.read<ScanCubit>().getScanHistory(),
                  child: state.scans.isEmpty ? Center(child: Text('No Scan Yet', style: Theme.of(context).textTheme.titleLarge,),) :SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                                            children: <Widget>[
                        ...state.scans.map((scan) => SizedBox(
                          height: 50,
                          child: ListTile(
                            leading: const Icon(Icons.history),
                            title: Text('${scan.errors} bugs', style: Theme.of(context).textTheme.titleLarge,),
                            subtitle: Text(scan.action, style: Theme.of(context).textTheme.titleSmall,),
                            trailing: Text(timeago.format(DateTime.fromMillisecondsSinceEpoch(scan.date)), style: Theme.of(context).textTheme.titleLarge,),
                          ),
                        ),),
                                            ]
                          .animate(interval: 400.ms)
                          .fade(duration: 300.ms),
                                          ),
                      )),
                );
              },
            ),
          )),
    );
  }
}
