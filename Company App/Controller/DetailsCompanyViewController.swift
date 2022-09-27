//
//  DetailsCompanyViewController.swift
//  Company App
//
//  Created by Donia Elshenawy on 26/09/2022.
//

import UIKit
import MapKit
import CoreLocation

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
        manger = CLLocationManager()
        print("long = \(longitude), lat= \(longitude), name= \(name), city= \(city)")
    }

    override func viewWillAppear(_ animated: Bool) {
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2D(latitude: Double(latitude)!, longitude: Double(longitude)!)
                annotation1.title = "donia"
                annotation1.subtitle = "welcome"
                self.map.addAnnotation(annotation1)
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
    
    func showLocationOnMap(){
        let myAnnotaion = Annotaion(c: CLLocationCoordinate2D(latitude: Double(latitude)!, longitude: Double(longitude)!), t: name, s: "Welcome in \(city) city")
        map.addAnnotation(myAnnotaion)
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print(name)
    }
}
