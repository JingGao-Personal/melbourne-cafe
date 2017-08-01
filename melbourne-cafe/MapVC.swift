//
//  MapVC.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 15/6/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    var cafe = [Cafe]()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.005, 0.005)
        let myLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true

    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        print(cafe.count)
        //        print(test)
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 20
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        test()
        mapView.delegate = self
        
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = CLLocationCoordinate2DMake(cafe[1].latitude, cafe[1].longtitude)
//        annotation.title = cafe[0].cafeName
//        annotation.subtitle = "This is the test"
//        mapView.addAnnotation(annotation)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func backTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func test() {
        for i in 0...(cafe.count - 1) {
            let newLocation = OtherLocation(identifier: "OtherLocation", title: cafe[i].cafeName, subtitle: cafe[i].distance, coordinate: CLLocationCoordinate2D(latitude: cafe[i].latitude, longitude: cafe[i].longtitude))
            mapView.addAnnotation(newLocation)
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "OtherLocation"
        
        if annotation is OtherLocation {
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKPinAnnotationView
            
            if annotationView == nil {
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView!.canShowCallout = true
                
                let btn = UIButton(type: .detailDisclosure)
                annotationView!.rightCalloutAccessoryView = btn
            } else {
                annotationView!.annotation = annotation
            }
            
            return annotationView
        }
        
        return nil
        
    }
    
    
    
}
