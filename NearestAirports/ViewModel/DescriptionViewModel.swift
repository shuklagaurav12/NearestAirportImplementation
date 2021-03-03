//
//  DescriptionViewModel.swift
//  NearestAirports
//
//  Created by Shukla, Gaurav on 03/03/21.
//

import Foundation
import UIKit
import CoreLocation


class DescriptionViewModal
{
    var arrfilter = [AirportElement]()
    weak var vcDescription: DescriptionVC?
 
    func filterLocation()
    {
        if let description = vcDescription?.arrDescriptionModel{
            vcDescription?.arrData = (vcDescription?.arrData.filter{$0.country!.contains(description.country ?? "NA")})!
            arrfilter.append(description) // add current location
            let lat  = (description.lat! as NSString).doubleValue
            let lon  = (description.lon! as NSString).doubleValue
            let p1 = CLLocation(latitude: lat, longitude: lon)
            filterDistance(distance1: p1, arrDistance: vcDescription!.arrData)
            }
        }
    
    func filterDistance(distance1 : CLLocation, arrDistance : [AirportElement]){
        for location in arrDistance{
            let lat = (location.lat! as NSString).doubleValue
            let lon = (location.lon! as NSString).doubleValue
            let distance2 = CLLocation(latitude: lat, longitude: lon)
            let distance = distance1.distance(from: distance2)/1000
            if distance <= 300 && distance != 0.0 && arrfilter.count <= 6 {
                arrfilter.append(location)
            }
        }
        self.vcDescription?.tblView.reloadData()

    }
    
 }
    

