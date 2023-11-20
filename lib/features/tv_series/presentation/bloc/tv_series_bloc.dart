import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tv_series_event.dart';
part 'tv_series_state.dart';

class TvSeriesBloc extends Bloc<TvSeriesEvent, TvSeriesState> {
  TvSeriesBloc() : super(TvSeriesInitial()) {
    on<TvSeriesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
