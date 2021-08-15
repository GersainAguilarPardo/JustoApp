//
//  GeolocationViewModel.swift
//  Justo
//
//  Created by Gersain Aguilar on 14/08/21.
//

import UIKit
import GoogleMaps

class GeolocationViewModel: NSObject {
    
    var latLongData : NSDictionary = [:]
    
    func generateData(){
        
        let userAddresData = SingletonSession.shared().userRandomData["location"] as! NSDictionary
        
        latLongData = userAddresData["coordinates"] as! NSDictionary
    }
    
    func createPin(_ mapView: GMSMapView){
        
        let lat = (latLongData["latitude"] as! NSString).doubleValue
        let long = (latLongData["longitude"] as! NSString).doubleValue
        
        let position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        
        let marker = GMSMarker(position: position)
            marker.title = "Random location"
            marker.map = mapView
            
        mapView.camera = GMSCameraPosition(target: position,zoom: 15,bearing: 0,viewingAngle: 0)
    }
}
