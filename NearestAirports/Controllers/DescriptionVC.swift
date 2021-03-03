//
//  DescriptionVC.swift
//  NearestAirports
//
//  Created by Shukla, Gaurav on 02/03/21.
//

import UIKit

class DescriptionVC: UIViewController {
   
    @IBOutlet weak var tblView: UITableView!
    var descriptionModel = DescriptionViewModal()
    
    var arrData = [AirportElement]()
    var arrDescriptionModel: AirportElement?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionModel.vcDescription = self
        descriptionModel.filterLocation()
    }
    
    @IBAction func backBtn_Action(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
  
}



extension DescriptionVC: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return descriptionModel.arrfilter.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? airportDescription
           cell?.model1 = descriptionModel.arrfilter[indexPath.row]
           return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0;//Choose your custom row height
    }
}
