//
//  AirportViewModel.swift
//  NearestAirports
//
//  Created by Shukla, Gaurav on 02/03/21.
//

import Foundation
import UIKit
import MBProgressHUD


class AirportViewModal
{
    var arrAirportData     = [AirportElement]()
    var autocompleteCities = [String]()
    var filteredData = [AirportElement]()
    var filtered = false
    
    weak var vc: ViewController?
    
    
    // Api Call
    func getAllAirportData()
    {
        MBProgressHUD.showAdded(to: (vc?.view)!, animated: true)
        let apiURL = URL(string: ApiEndpoints.airports)!
        let httpUtility = HttpUtility()
        
        httpUtility.getApiData(requestUrl: apiURL, resultType: [AirportElement].self) { (result) in
            if(result?.count != 0)
            {
                self.arrAirportData.append(contentsOf: result!)
                DispatchQueue.main.async{ [self] in
                    self.vc?.tblView.reloadData()
                    MBProgressHUD.hide(for: vc!.view, animated: true)
                }
            }
        }
    }
    
    // searchField 
    func textFieldSearch(){
        self.filteredData.removeAll()
        let searchData:Int = (vc?.searchCityTF.text!.count)!
        if searchData != 0 {
            filtered = true
            for string in self.arrAirportData {
                if let fruitToSearch = vc?.searchCityTF.text{
                    let range = string.city!.lowercased().range(of: fruitToSearch, options: .caseInsensitive, range: nil, locale: nil)
                    if range != nil{
                        self.filteredData.append(string)
                    }
                }
            }
        }else{
            filteredData = arrAirportData
            filtered = false
        }
        vc?.tblView.reloadData()
    }
   
}



