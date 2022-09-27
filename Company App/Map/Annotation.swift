//
//  Annotation.swift
//  Company App
//
//  Created by Donia Elshenawy on 27/09/2022.
//

import Foundation
import MapKit

class Annotaion : NSObject, MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    init(c: CLLocationCoordinate2D, t: String, s: String) {
        coordinate = c
        title = t
        subtitle = s
    }
}
