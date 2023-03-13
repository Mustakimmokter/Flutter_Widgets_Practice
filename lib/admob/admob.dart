import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:widget_practice_one/widgets/custom_container.dart';
import 'package:widget_practice_one/widgets/custom_text.dart';



class GoogleAdmob extends StatefulWidget {
  const GoogleAdmob({Key? key}) : super(key: key);

  @override
  State<GoogleAdmob> createState() => _GoogleAdmobState();
}

class _GoogleAdmobState extends State<GoogleAdmob> {
  bool _isLoaded = false;
  BannerAd? _bannerAd;




  /// Loads an interstitial ad.
  void loadInterstitialAd() {
    final adUnitId = Platform.isAndroid
        ? 'ca-app-pub-3940256099942544/1033173712'
        : 'ca-app-pub-3940256099942544/4411468910';
    InterstitialAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
           // _interstitialAd = ad;
            ad.show();
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
          },
        ));
  }

  void loadBanner() {

    final adUnitId = Platform.isAndroid
        ? 'ca-app-pub-3940256099942544/6300978111'
        : 'ca-app-pub-3940256099942544/2934735716';
    _bannerAd = BannerAd(
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            _isLoaded = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) {},
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) {},
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) {},
      ),
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,

    );
    _bannerAd!.load();

  }
  @override
  void initState() {
    super.initState();
    loadBanner();
    loadInterstitialAd();
  }

  SizedBox adWidget (){
    if (_bannerAd != null) {
     return SizedBox(
        height: _bannerAd!.size.height.toDouble(),
        width: _bannerAd!.size.width.toDouble(),
        child: AdWidget(ad: _bannerAd!),
      );
    }else{
      return const SizedBox(
        height: 50,
        width: double.maxFinite,
        child: CustomText(text: 'Add not founded',),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            Expanded(
              child: CustomContainer(
                color: Colors.red,
              ),
            ),
            adWidget(),

          ],
        ),
      ),
    );
  }
}

