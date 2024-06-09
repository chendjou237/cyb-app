part of 'scan_cubit.dart';

sealed class ScanState extends Equatable {
  const ScanState(
    {this.bugs = 0, this.scans = const []}
  );
  final int bugs;
  final List<ScanModel> scans;

  @override
  List<Object> get props => [bugs, scans];
}

final class ScanInitial extends ScanState {}

final class ScanInProgress extends ScanState {
  final String message;

  const ScanInProgress(this.message);

  @override
  List<Object> get props => [message];
}

final class ScanComplete extends ScanState {

  const ScanComplete( {required super.bugs});

}

final class ScanError extends ScanState {
  final String message;

  const ScanError(this.message);

  @override
  List<Object> get props => [message];
}

final class ScanRecordInProgress extends ScanState {
  final String message;

  const ScanRecordInProgress(this.message);

  @override
  List<Object> get props => [message];
}

final class ScanRecordComplete extends ScanState {
  final String message;

  const ScanRecordComplete(this.message);

  @override
  List<Object> get props => [message];
}

final class ScanGetHistoryComplete extends ScanState{
  const ScanGetHistoryComplete({required super.scans});
}

