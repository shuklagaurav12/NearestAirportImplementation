//
//  ViewController.swift
//  NearestAirports
//
//  Created by Shukla, Gaurav on 02/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var searchCityTF: UITextField!
    var viewModelAirport = AirportViewModal()
    var descriptionModel = DescriptionViewModal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelAirport.vc = self
        viewModelAirport.checkData()
        
        // textField Action
        self.searchCityTF.addTarget(self, action: #selector(tetxFieldSearch), for: .editingChanged)
    }
    
    // textfield Search Action
    @objc func tetxFieldSearch (sender: UITextField){
        viewModelAirport.textFieldSearch()
    }
    
    @IBAction func btnRefresh_Action(_ sender: Any) {
        viewModelAirport.deleteAllData()
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !viewModelAirport.filteredData.isEmpty {
        return viewModelAirport.filteredData.count
        }else{
        return viewModelAirport.arrAirportData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? airportCell
        if !viewModelAirport.filteredData.isEmpty {
            cell?.model = viewModelAirport.filteredData[indexPath.row]
        }else{
            cell?.model = viewModelAirport.arrAirportData[indexPath.row]
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let obj = (self.storyboard?.instantiateViewController(identifier: "DescriptionVC"))! as DescriptionVC
        
        obj.arrData = viewModelAirport.arrAirportData
        if !viewModelAirport.filteredData.isEmpty {
            obj.arrDescriptionModel = viewModelAirport.filteredData[indexPath.row]
        }else{
            obj.arrDescriptionModel = viewModelAirport.arrAirportData[indexPath.row]
        }
        self.navigationController?.pushViewController(obj, animated: true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}

