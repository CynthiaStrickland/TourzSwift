//
//  MapViewController.swift
//  TourzSwift
//
//  Created by Cynthia Whitlatch on 2/2/17.
//  Copyright © 2017 Cynthia Sinclair. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MapViewController: UIViewController {

    var mapView: GMSMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GMSServices.provideAPIKey("AIzaSyBxf_HKoQMBH5cZNP8hQ1D9Wn1weR7j_14")
        let camera = GMSCameraPosition.camera(withLatitude: 37.621262, longitude: -122.378945, zoom: 12)
        mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)

        view = mapView
        
        let currentLocation = CLLocationCoordinate2DMake(37.621262, -122.378945)
        let marker = GMSMarker(position: currentLocation)
        marker.title = "SFO Airport"
        marker.map = mapView
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(MapViewController.next as (MapViewController) -> () -> ()))
        
    }
    
    func next() {
        let nextLocation = CLLocationCoordinate2DMake(37.792871, -122.397055)
        mapView?.camera = GMSCameraPosition.camera(withLatitude: nextLocation.latitude, longitude: nextLocation.longitude, zoom: 15)
        let marker = GMSMarker(position: nextLocation)
        marker.title = "Embarcadero Station"
        marker.snippet = "Subway"
        marker.map = mapView
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
