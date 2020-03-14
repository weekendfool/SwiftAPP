//
//  ViewController.swift
//  mapAndProtocol
//
//  Created by 尾原徳泰 on 2020/03/14.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate,UIGestureRecognizerDelegate, SearchLocationDelegate {
    
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    var locmManager:CLLocationManager!
    
    @IBOutlet weak var settingButton: UIButton!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet var longPress: UILongPressGestureRecognizer!
    
    var addressString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        settingButton.backgroundColor = .white
        settingButton.layer.cornerRadius = 20.0
    }

    @IBAction func longPressTap(_ sender: UILongPressGestureRecognizer) {
        
        if sender.state == .began {
            
        } else if sender.state == .ended {
            
            let tapPoint = sender.location(in: view)
            
            let center = mapView.convert(tapPoint, toCoordinateFrom: mapView)
            
            let lat = center.latitude
            
            let log = center.longitude
            
            convert(lat: lat, log: log)
            
            
        }
    }
    
    func convert(lat:CLLocationDegrees, log:CLLocationDegrees) {
        
        let geocoder = CLGeocoder()
        
        let location = CLLocation(latitude: lat, longitude: log)
        
        geocoder.reverseGeocodeLocation(location) { (placeMark, Error) in
            
            if let placeMark = placeMark {
                
                if let pm = placeMark.first {
                    
                    if pm.administrativeArea != nil || pm.locality != nil {
                        
                        self.addressString = pm.name! + pm.administrativeArea! + pm.locality!
                        
                    } else {
                        self.addressString = pm.name!
                    }
                    
                    self.addressLabel.text = self.addressString
                }
            }
        }
    }
    
    
    @IBAction func goToSearchVC(_ sender: Any) {
        
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "next" {
            
            let nextVC = segue.destination as! NextViewController
            
            nextVC.delegate = self
        }
    }
    
    func serchLocation(idoValue: String, keidoValue: String) {
        
        if idoValue.isEmpty != true && keidoValue.isEmpty != true {
            
            let idoStoring = idoValue
            
            let keidoStoring = keidoValue
            
            let coodinate = CLLocationCoordinate2DMake(Double(idoStoring)!, Double(keidoStoring)!)
            
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            
            let region = MKCoordinateRegion(center: coodinate, span: span)
            
            mapView.setRegion(region, animated: true)
            
            convert(lat: Double(idoStoring)!, log: Double(keidoStoring)!)
            
            addressLabel.text = addressString
            
        } else {
            addressLabel.text = "表示できません"
        }
    }
    
}

