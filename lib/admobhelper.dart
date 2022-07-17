import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:note_app/methods/fetchdata.dart';

class AdmobHelper {
  static String get bannerID => Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/6300978111';

  InterstitialAd? _interstitialAd;
  int num_of_attempt_load = 0;

  static initialize() {
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  // static BannerAd getBannerAd() {
  //   BannerAd bAd = new BannerAd(
  //       size: AdSize.fullBanner,
  //       adUnitId: bannerID,
  //       listener: BannerAdListener(onAdClosed: (Ad ad) {
  //         print("Ad Closed");
  //       }, onAdFailedToLoad: (Ad ad, LoadAdError error) {
  //         ad.dispose();
  //       }, onAdLoaded: (Ad ad) {
  //         print('Ad Loaded');
  //       }, onAdOpened: (Ad ad) {
  //         print('Ad opened');
  //       }),
  //       request: AdRequest());
  //   return bAd;
  // }

  // static BannerAd getbigBannerAd() {
  //   BannerAd bigAd = new BannerAd(
  //       size: AdSize.mediumRectangle,
  //       adUnitId: bannerID,
  //       listener: BannerAdListener(onAdClosed: (Ad ad) {
  //         print("Ad Closed");
  //       }, onAdFailedToLoad: (Ad ad, LoadAdError error) {
  //         ad.dispose();
  //       }, onAdLoaded: (Ad ad) {
  //         print('Ad Loaded');
  //       }, onAdOpened: (Ad ad) {
  //         print('Ad opened');
  //       }),
  //       request: AdRequest());
  //   return bigAd;
  // }

  // static BannerAd getmidBannerAd() {
  //   BannerAd midAd = new BannerAd(
  //       size: AdSize.largeBanner,
  //       adUnitId: bannerID,
  //       listener: BannerAdListener(onAdClosed: (Ad ad) {
  //         print("Ad Closed");
  //       }, onAdFailedToLoad: (Ad ad, LoadAdError error) {
  //         ad.dispose();
  //       }, onAdLoaded: (Ad ad) {
  //         print('Ad Loaded');
  //       }, onAdOpened: (Ad ad) {
  //         print('Ad opened');
  //       }),
  //       request: AdRequest());
  //   return midAd;
  // }

  // create interstitial ads

  void createInterad() {
    print('called');
      InterstitialAd.load(
        // adUnitId: 'ca-app-pub-3940256099942544/1033173712',
        adUnitId: 'ca-app-pub-9660935149220558/4113904557',
        request: AdRequest(),
        adLoadCallback:
            InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          num_of_attempt_load = 0;
          showInterad();
        }, onAdFailedToLoad: (LoadAdError error) {
          num_of_attempt_load + 1;
          _interstitialAd = null;
          if (num_of_attempt_load <= 1) {
            createInterad();
          }
        }),
      );
  }

  // show interstitial ads to user
  void showInterad() {
    if (_interstitialAd == null) {
      print("null");
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (InterstitialAd ad) {
      print("ad onAdshowedFullscreen");
    }, onAdDismissedFullScreenContent: (InterstitialAd ad) {
      print("ad Disposed");
      ad.dispose();
    }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError aderror) {
      print('$ad OnAdFailed $aderror');
      ad.dispose();
      createInterad();
    });
    _interstitialAd!.show();
    _interstitialAd = null;
  }

  // void createInterVideoad() {
  //   InterstitialAd.load(
  //     adUnitId: 'ca-app-pub-9660935149220558/7541808780',
  //     // adUnitId: 'ca-app-pub-3940256099942544/1033173712',
  //     request: AdRequest(),
  //     adLoadCallback:
  //         InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
  //       _interstitialAd = ad;
  //       num_of_attempt_load = 0;
  //       showInterVideoad();
  //     }, onAdFailedToLoad: (LoadAdError error) {
  //       num_of_attempt_load + 1;
  //       _interstitialAd = null;
  //       if (num_of_attempt_load <= 1) {
  //         createInterVideoad();
  //       }
  //     }),
  //   );
  // }

// show interstitial ads to user
//   void showInterVideoad() {
//     if (_interstitialAd == null) {
//       print("null");
//       return;
//     }
//     _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
//         onAdShowedFullScreenContent: (InterstitialAd ad) {
//       print("ad onAdshowedFullscreen");
//     }, onAdDismissedFullScreenContent: (InterstitialAd ad) {
//       print("ad Disposed");
//       ad.dispose();
//     }, onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError aderror) {
//       print('$ad OnAdFailed $aderror');
//       ad.dispose();
//       createInterVideoad();
//     });
//     _interstitialAd!.show();
//     _interstitialAd = null;
//   }

}
