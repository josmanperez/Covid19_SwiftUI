//
//  MapView.swift
//  Covid19Stats
//
//  Created by Josman Pedro Pérez Expósito on 21/12/20.
//

import SwiftUI
import UIKit
import MapKit

struct MapView: UIViewRepresentable {
    
    @Binding var countryData: [Country]

    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        
        var allAnnotations: [CoronaCaseAnnotation] = []
        
        for data in countryData {
            guard let _ = data.countryInfo._id, let _lat = data.countryInfo.lat, let _long = data.countryInfo.long else { continue }
            let title = data.country
                + "\n Confirmed: " + "\(data.cases?.formatNumber() ?? "N/A")"
                + "\n Death: " + "\(data.deaths?.formatNumber() ?? "N/A")"
            let coordinate = CLLocationCoordinate2D(latitude: _lat, longitude: _long)
            
            allAnnotations.append(CoronaCaseAnnotation(title: title, coordinate: coordinate))
        }
        
        uiView.annotations.forEach { (annotation) in
            uiView.removeAnnotation(annotation)
        }
        uiView.addAnnotations(allAnnotations)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        return MKMapView()
    }
    
}


class CoronaCaseAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    
    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
    
    
    
}
