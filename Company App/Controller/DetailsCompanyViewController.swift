//
//  DetailsCompanyViewController.swift
//  Company App
//
//  Created by Donia Elshenawy on 26/09/2022.
//

import UIKit
import MapKit
//import CoreLocation

class DetailsCompanyViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var idView: UIView!
    @IBOutlet weak var countryView: UIView!
    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var mappView: UIView!
    var id = ""
    var country = ""
    var city = ""
    var longitude = ""
    var latitude = ""
    var name = ""
    var manger: CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        setDataTOLabels()
        createShadowOfView(yourView: idView)
        createShadowOfView(yourView: countryView)
        createShadowOfView(yourView: cityView)
        createShadowOfView(yourView: mappView)
        map.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let location = CLLocation(latitude: Double(latitude)!, longitude: Double(longitude)!)
        setStartingLocation(location: location, distance: 1000)
        addAnnotation()
    }
    
    func setDataTOLabels(){
        idLabel.text = id
        countryLabel.text = country
        cityLabel.text = city
    }
    
    func createShadowOfView(yourView: UIView){
        yourView.layer.shadowColor = UIColor.lightGray.cgColor
        yourView.layer.shadowOpacity = 1
        yourView.layer.shadowOffset = .zero
        yourView.layer.shadowRadius = 1
        yourView.layer.borderWidth = 0
        yourView.layer.cornerRadius = 10
    }
    
    func addAnnotation(){
        let myAnnotaion = Annotaion(c: CLLocationCoordinate2D(latitude: Double(latitude)!, longitude: Double(longitude)!), t: name, s: "Welcome in \(city) city")
        map.addAnnotation(myAnnotaion)
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print(name)
    }
    
    func setStartingLocation(location: CLLocation, distance: CLLocationDistance){
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: distance, longitudinalMeters: distance)
        map.setRegion(region, animated: true)
        map.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 30000)
        map.setCameraZoomRange(zoomRange, animated: true)
    }
}
