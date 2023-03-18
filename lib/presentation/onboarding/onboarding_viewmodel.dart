import 'dart:async';

import 'package:flutter_mvvm_tech/domain/model.dart';
import 'package:flutter_mvvm_tech/presentation/base/baseviewmodel.dart';

import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel with OnBoardingViewModelInputs, OnBoardingViewModelOutputs{

  //Stream controller
  StreamController _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;
  // inputs
  @override
  void dispose() {
    _streamController.close();

  }

  @override
  void start() {
    _list = _getSliderData();
    // send slider data to our view
    _postDataToView();
  }

  @override
  void goNext() {
    int nextIndex = _currentIndex++; // +1
    if (nextIndex >= _list.length - 1) {
      _currentIndex = 0; // infinite loop to go to first item inside the slider
    }
    _postDataToView();
  }

  @override
  void goPrevious() {
    int previousIndex = _currentIndex--;
    if(previousIndex == -1){
      _currentIndex = _list.length - 1; // infinite loop to go to the length of slider list again
    }
    _postDataToView();
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;

  // outputs
  @override
  // TODO: implement outputSliderViewObject
  Stream<SliderViewObject> get outputSliderViewObject => _streamController.stream.map((sliderObject) => sliderObject);

  // private functions
  List<SliderObject> _getSliderData() => [
    SliderObject(AppStrings.onBoardingTitle1, AppStrings.onBoardingSubTitle1, ImageAssets.onBoardingLogo1),
    SliderObject(AppStrings.onBoardingTitle2, AppStrings.onBoardingSubTitle2, ImageAssets.onBoardingLogo2),
    SliderObject(AppStrings.onBoardingTitle3, AppStrings.onBoardingSubTitle3, ImageAssets.onBoardingLogo3),
    SliderObject(AppStrings.onBoardingTitle4, AppStrings.onBoardingSubTitle4, ImageAssets.onBoardingLogo4),
  ];

  _postDataToView(){
    inputSliderViewObject.add(SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
}

// inputs mean the orders that our view model will  receive from our view
abstract class OnBoardingViewModelInputs{
   void goNext(); // when user clicks on right arrow or swap right
   void goPrevious(); // when user click on left arrow or swap left
   void onPageChanged(int index);
   Sink get inputSliderViewObject; // this is the way to add data to the stream .. stream input
}

// outputs mean data or results that will be send to our view model to our view
abstract class OnBoardingViewModelOutputs{
  Stream<SliderViewObject> get outputSliderViewObject;
}
class SliderViewObject{
   SliderObject sliderObject;
   int numberOfSlides;
   int currentIndex;

   SliderViewObject(this.sliderObject, this.numberOfSlides, this.currentIndex);
}