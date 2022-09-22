//
//  AMapView.swift
//  run_fish
//
//  Created by chaufan Yu on 2022/9/6.
//

import SwiftUI
import AMapNaviKit

final class AMapView:NSObject, UIViewRepresentable, MAMapViewDelegate {
    func makeUIView(context: Context) -> MAMapView {
//        AMapNaviGPSSignalStrength
        
        MAMapView.updatePrivacyAgree(AMapPrivacyAgreeStatus.didAgree);
        MAMapView.updatePrivacyShow(AMapPrivacyShowStatus.didShow, privacyInfo: AMapPrivacyInfoStatus.didContain);
//        startUpdatingLocation
//        AMapNaviLocation.startUpdatingLocation
        let MapView = MAMapView()
        MapView.delegate = self // 必须在showsUserLocation之前
        MapView.showsUserLocation = true
        MapView.userTrackingMode = .follow
        MapView.setZoomLevel(17, animated: true)
        print("GPS:")
        print(MapView.userLocation.location?.horizontalAccuracy)
        
        return MapView
    }
    
    func updateUIView(_ uiView: MAMapView, context: Context) {
    
    }
    
    // 要在iOS 11及以上版本使用后台定位服务, 需要实现 mapViewRequireLocationAuth: 代理方法
    func mapViewRequireLocationAuth(_ locationManager: CLLocationManager!) {
        locationManager.requestAlwaysAuthorization()
    }
    
    func amapLocationManager(_ manager: AMapLocationManager!, didUpdate location: CLLocation!) {
        print("location:{lat:\(location.coordinate.latitude); lon:\(location.coordinate.longitude); accuracy:\(location.horizontalAccuracy)};");
    }
    
    typealias UIViewType = MAMapView
    
    
}
