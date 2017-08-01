//
//  otherLocation.swift
//  melbourne-cafe
//
//  Created by Jing Gao on 28/7/17.
//  Copyright © 2017 Jing Gao. All rights reserved.
//

import Foundation
import MapKit

class OtherLocation: NSObject, MKAnnotation {
    
    var identifier: String?
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(identifier: String, title: String, subtitle: Double, coordinate: CLLocationCoordinate2D) {
        self.identifier = identifier
        self.title = title
        self.subtitle = String(format: "%.2f", subtitle) + " m"
        self.coordinate = coordinate
    }
    
}
