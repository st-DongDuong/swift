//
//  MapVC.swift
//  Dong
//
//  Created by Dong Duong V. on 5/4/22.
//

import UIKit
import MapKit
class MapVC: UIViewController {

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
    
//        let source = CLLocationCoordinate2D(latitude: 16.071668, longitude: 108.230178)
//               addPin(coordinate: source, title: "Vincom", subTitle: "Da Nang, Viet Nam")
//
//               let destination = CLLocationCoordinate2D(latitude: 16.080838, longitude: 108.238573)
//               addPin(coordinate: destination, title: "Asian Tech", subTitle: "Da Nang, Viet Nam")
//
//               routing(source: source, destination: destination)
               
           
           
    
    }
    func addAnnotation() {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: 16.071763, longitude: 108.223963)
            annotation.title = "Point 0001"
            annotation.subtitle = "subtitle 0001"
            
            map.addAnnotation(annotation)
        }

    func center(location: CLLocation) {
            //center
            map.setCenter(location.coordinate, animated: true)
            
            //zoom
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            map.setRegion(region, animated: true)
        }

}
extension MapVC: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
        pin.animatesDrop = true
        pin.pinTintColor = .red
        map.delegate = self
        return pin
    }
}
