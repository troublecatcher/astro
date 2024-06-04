import 'package:bloc/bloc.dart';

enum FeatureState { main, horoscopes, palmistry, tarot, natal }

class FeatureSelectionCubit extends Cubit<FeatureState> {
  FeatureSelectionCubit() : super(FeatureState.main);
  set(FeatureState featureState) => emit(featureState);
}
