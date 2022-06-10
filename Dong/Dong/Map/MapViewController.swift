//
//  MapVC.swift
//  Dong
//
//  Created by Dong Duong V. on 5/4/22.
//

import UIKit
import MapKit
class MapViewController: UIViewController {
    
    @IBOutlet weak var map: MKMapView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let dannangLocation = CLLocation(latitude: 16.072163, longitude:  108.227071)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: dannangLocation.coordinate, span: span)
       
        map.region = region
        map.showsUserLocation = true
        map.mapType = .hybrid
        addAnnotation()
        
    }
    
    func addAnnotation() {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 16.071763, longitude: 108.223963)
        annotation.title = "Point 0001"
        annotation.subtitle = "subtitle 0001"
        
        map.addAnnotation(annotation)
    }
    
    func center(location: CLLocation) {
        map.setCenter(location.coordinate, animated: true)
    
        //zoom
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        map.setRegion(region, animated: true)
    }
}

extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        pin.animatesDrop = true
        pin.pinTintColor = .red
        map.delegate = self
        return pin
    }
}
