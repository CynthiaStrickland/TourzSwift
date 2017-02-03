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

class TourDestinations: NSObject {
    
    let name: String
    let location: CLLocationCoordinate2D
    let zoom: Float
    
    
    init(name:String, location:CLLocationCoordinate2D, zoom:Float) {
        self.name = name
        self.location = location
        self.zoom = zoom
    }
}
class MapViewController: UIViewController {

    var mapView: GMSMapView?
    
    var currentLocation: TourDestinations?
    
    let destinations = [TourDestinations(name: "Embarcaderao", location: CLLocationCoordinate2D(latitude: 37.792871, longitude: -122.397055), zoom: 15), TourDestinations(name: "Ferry Building", location: CLLocationCoordinate2D(latitude: 37.795531, longitude: -122.393451), zoom: 15)]
    
    @IBOutlet weak var map: GMSMapView!
    
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
        if currentLocation == nil {
            currentLocation = destinations.first
        } else {
            if let index = destinations.index(of: currentLocation!) {
                currentLocation = destinations[index + 1]
            }
        }
        
        setMapCamera()
    }
    
    private func setMapCamera() {
        CATransaction.begin()
        CATransaction.setValue(1.5, forKey: kCATransactionAnimationDuration)
        
        mapView?.animate(to: GMSCameraPosition.camera(withTarget: currentLocation!.location, zoom: currentLocation!.zoom))
        
        let marker = GMSMarker(position: currentLocation!.location)
        marker.title = currentLocation?.name
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
