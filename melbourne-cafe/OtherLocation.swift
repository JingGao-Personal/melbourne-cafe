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
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
    
}
