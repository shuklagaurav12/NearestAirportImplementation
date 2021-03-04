//
//  AirportManager.swift
//  NearestAirports
//
//  Created by Shukla, Gaurav on 04/03/21.
//

import Foundation
import CoreData


struct AirportManager {
    
    
    func create(arrElement: [AirportElement]) {
    _ = arrElement.map{self.createEntityFrom(arr: $0)}
    }
    
    private  func createEntityFrom(arr: AirportElement) -> CRAirportElement?{

    let crData = CRAirportElement(context: PersistentStorage.shared.context)
        crData.lat  =  arr.lat
        crData.lon  = arr.lon
        crData.name = arr.name
        crData.city = arr.city
        crData.state = arr.state
        crData.country = arr.country
        crData.woeid  = arr.woeid
        crData.tz  = arr.tz
        crData.phone = arr.phone
        crData.type = arr.type
        crData.email = arr.email
        crData.url  = arr.url
        crData.runwayLength = arr.runwayLength
        crData.elev = arr.elev
        crData.icao = arr.icao
        crData.directFlights = arr.directFlights
        crData.carriers = arr.carriers
        PersistentStorage.shared.saveContext()
        return crData
    }
    

    func getAll() -> [AirportElement]? {

        let result = PersistentStorage.shared.fetchManagedObject(managedObject: CRAirportElement.self)

        var arrElement : [AirportElement] = []
        
        print("result value is =======",result?.count as Any)

        result?.forEach({ (arr) in
            arrElement.append(arr.convertToEmployee())
        })

        return arrElement
    }
    
    func deleteAllData() {
        for entityName in ["CRAirportElement"]{
               let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
               let delAllReqVar = NSBatchDeleteRequest(fetchRequest: request)
               do {
                try PersistentStorage.shared.context.execute(delAllReqVar)
               }
               catch { print(error) }
           }
    }
    
}
