//
//  airportCell.swift
//  NearestAirports
//
//  Created by Shukla, Gaurav on 02/03/21.
//

import UIKit

class airportCell: UITableViewCell {

    @IBOutlet weak var lblCityName: UILabel!
    
    var model: AirportElement?{
        didSet{
            userConfiguration()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func userConfiguration(){
        lblCityName.text = model?.city
    }

}
