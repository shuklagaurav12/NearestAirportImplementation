//
//  CRAirportElement+CoreDataProperties.swift
//  NearestAirports
//
//  Created by Shukla, Gaurav on 04/03/21.
//
//

import Foundation
import CoreData


extension CRAirportElement {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CRAirportElement> {
        return NSFetchRequest<CRAirportElement>(entityName: "CRAirportElement")
    }

    @NSManaged public var carriers: String?
    @NSManaged public var city: String?
    @NSManaged public var code: String?
    @NSManaged public var country: String?
    @NSManaged public var directFlights: String?
    @NSManaged public var elev: String?
    @NSManaged public var email: String?
    @NSManaged public var icao: String?
    @NSManaged public var lat: String?
    @NSManaged public var lon: String?
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var runwayLength: String?
    @NSManaged public var state: String?
    @NSManaged public var type: String?
    @NSManaged public var tz: String?
    @NSManaged public var url: String?
    @NSManaged public var woeid: String?
    
    func convertToEmployee() -> AirportElement
      {
          return AirportElement(code: code, lat: lat, lon: lon, name: name, city: city, state: state, country: country, woeid: woeid, tz: tz, phone: phone, type: type, email: email, url: url, runwayLength: runwayLength, elev: elev, icao: icao, directFlights: directFlights, carriers: carriers)
      }

}

extension CRAirportElement : Identifiable {

}
