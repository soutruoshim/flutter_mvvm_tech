import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mvvm_tech/presentation/onboarding/onboarding_viewmodel.dart';
import 'package:flutter_mvvm_tech/presentation/resources/assets_manager.dart';
import 'package:flutter_mvvm_tech/presentation/resources/color_manager.dart';
import 'package:flutter_mvvm_tech/presentation/resources/strings_manager.dart';
import 'package:flutter_mvvm_tech/presentation/resources/values_manager.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/model.dart';
class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {

  PageController _pageController = PageController(initialPage: 0);

  OnBoardingViewModel _onBoardingViewModel = OnBoardingViewModel();

  _bind(){
    _onBoardingViewModel.start();
  }
  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _onBoardingViewModel.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
     return StreamBuilder<SliderViewObject>(
         stream: _onBoardingViewModel.outputSliderViewObject,
         builder: (context, snapshot){
         return _getContentWidget(snapshot.data);
     });
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject){
    if(sliderViewObject == null){
      return Container();
    }else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSize.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.white,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark
          ),
        ),
        body: PageView.builder(
            controller: _pageController,
            itemCount: sliderViewObject.numberOfSlides,
            onPageChanged: (index) {
              _onBoardingViewModel.onPageChanged(index);
            },
            itemBuilder: (context, index) {
              // return onBoardingPage
              return OnBoardingPage(sliderViewObject.sliderObject);
            }
        ),
        bottomSheet: Container(
          color: ColorManager.white,
          height: AppSize.s100,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: () {}, child: Text(
                  AppStrings.skip,
                  style: Theme
                      .of(context)
                      .textTheme
                      .subtitle2,
                  textAlign: TextAlign.end,
                )),
              ),
              // add layout for indicator and arrows
              _getBottomSheetWidget(sliderViewObject)
            ],
          ),
        ),
      );
    }
  }
  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject){
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow
          Padding(padding: EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrowIc),
              ),
              onTap: (){
                // go to preview slide

              _onBoardingViewModel.goPrevious();
              },
            ),
          ),
          // circle indicator
          Row(
            children: [
              for(int i = 0; i < sliderViewObject.numberOfSlides; i++)
                Padding(
                  padding: EdgeInsets.all(AppPadding.p8),
                  child: _getPropertyCircle(i, sliderViewObject.currentIndex),
                )
            ],
          ),

          // right arrow
          Padding(padding: EdgeInsets.all(AppPadding.p14),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightArrowIc),
              ),
              onTap: (){
                // go to next slide
                _onBoardingViewModel.goNext();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _getPropertyCircle(int index, int currentIndex){
     if(index == currentIndex){
       return SvgPicture.asset(ImageAssets.hollowCirlceIc);
     }else{
       return SvgPicture.asset(ImageAssets.solidCircleIc);
     }
  }
}

class OnBoardingPage extends StatelessWidget {
  SliderObject _sliderObject;

  OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: AppSize.s40,),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(_sliderObject.title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline4,),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(_sliderObject.subTitle, textAlign: TextAlign.center, style: Theme.of(context).textTheme.subtitle1,),
        ),
        SizedBox(height: AppSize.s60,),
        SvgPicture.asset(
        _sliderObject.image,
        ),
      ],
    );
  }
}


