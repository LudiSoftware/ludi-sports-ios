//
//  RedZoneViewController.swift
//  Ludi Sports
//
//  Created by Michael Cather on 7/8/23.
//

import UIKit
import GoogleMaps


class RedZoneViewController: UIViewController {
    
    @IBOutlet weak var redZoneMap: GMSMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let camera = GMSCameraPosition.camera(withLatitude: 34.3581, longitude: -86.2947, zoom: 50.0)
        redZoneMap.camera = camera

    }
    

}
