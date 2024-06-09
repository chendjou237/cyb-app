import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:test1/utils/logger.dart';

import '../../../models/models.dart';

part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  ScanCubit() : super(ScanInitial());

  bool isFirstScan = true;

  void recordScan(ScanModel scan)async{
emit(const ScanRecordInProgress('recording scan...'));
    try {
                  await Future.delayed(const Duration(seconds: 4));

  final box = Hive.box('settings');
     final data =List<String>.from( box.get('scans', defaultValue: []) );
    final scans = data.isEmpty ? <ScanModel>[]: data.map((datum) => ScanModel.fromJson(datum)).toList();
     scans.add(scan);
    final jsonScans =  scans.map((e) => e.toJson()).toList();
  box.put('scans',jsonScans);
  emit(const ScanRecordComplete('scan recorded successfully'));
} catch (e) {
  // TODO
  emit(const ScanError('error recording scan'));
} 
  }

  void startScan()async {
    final bugs = isFirstScan ? Random().nextInt(100): 0;
    isFirstScan = !isFirstScan;
    emit(const ScanInProgress('Scanning device...'));
    await Future.delayed(const Duration(seconds: 3));
    emit(const ScanInProgress('analysing all device folders'));
    await Future.delayed(const Duration(seconds: 3));
    emit(const ScanInProgress('scanning for threats'));
    await Future.delayed(const Duration(seconds: 2));
    emit(const ScanInProgress('detecting threats'));
    await Future.delayed(const Duration(seconds: 1));

    emit( ScanComplete(bugs: bugs));
  }

  void getScanHistory(){
    try {
      // Hive.box('settings').delete('scans');
   final box = Hive.box('settings');
    final data =List<String>.from( box.get('scans', defaultValue: []) );
    final scans = data.isEmpty ? <ScanModel>[]: data.map((datum) => ScanModel.fromJson(datum)).toList();
    emit(ScanGetHistoryComplete(scans: scans)); 
} on Exception catch (e) {
  logE(e);
  emit(const ScanError("couldn't get the scan history"));
}
  }
}
