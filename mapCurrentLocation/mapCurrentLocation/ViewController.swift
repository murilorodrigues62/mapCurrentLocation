//
//  ViewController.swift
//  mapCurrentLocation
//
//  Created by ifsp on 26/08/16.
//  Copyright © 2016 com.ifsp. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.locationManager.delegate = self
        
        // para termos a localização exata
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        // para pedir autorização para a localização
        self.locationManager.requestWhenInUseAuthorization()
        
        self.locationManager.startUpdatingLocation()
        
        // Mostra o ponto azul onde estamos
        self.mapView.showsUserLocation = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Location delegate methods
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        // localização do ponto onde estamos
        let location = locations.last
        
        // coloca o ponto no centro da tela
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        
        // seta o zoom - quanto maior o valor menos o zoom
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        self.mapView.setRegion(region, animated: true)
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManger(manager: CLLocationManager, didFailWithError error: NSError){
        print("Erros: " + error.localizedDescription)
    }


}

