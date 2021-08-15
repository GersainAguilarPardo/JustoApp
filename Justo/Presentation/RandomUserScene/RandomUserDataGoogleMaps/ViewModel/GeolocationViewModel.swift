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
    
    /// This function generate the data for lat long
    ///
    /// ```
    /// generateData() // Return nothing
    /// ```
    ///
    /// - Warning: This method generate all the information for UI Elements
    /// - Parameter Nothing: The method not need parameters
    /// - Returns: Nothing
    
    func generateData(){
        
        let userAddresData = SingletonSession.shared().userRandomData["location"] as! NSDictionary
        
        latLongData = userAddresData["coordinates"] as! NSDictionary
    }
    
    /// This function create a PIN in lat long that the Geopoint Random API generate
    ///
    /// ```
    /// createPin() // Return nothing
    /// ```
    ///
    /// - Warning: This method generate all the information for UI Elements
    /// - Parameter GMSMapView: The MapView for show the GMSMarker
    /// - Returns: Nothing
    
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
