//
//  GeolocationViewController.swift
//  Justo
//
//  Created by Gersain Aguilar on 14/08/21.
//

import UIKit
import GoogleMaps

class GeolocationViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    var geolocationViewModel = GeolocationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        geolocationViewModel.generateData()
        geolocationViewModel.createPin(mapView)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
