//
//  airportDescription.swift
//  NearestAirports
//
//  Created by Shukla, Gaurav on 02/03/21.
//

import UIKit

class airportDescription: UITableViewCell {

    @IBOutlet weak var lblRunwayLength: UILabel!
    @IBOutlet weak var lblCountryName: UILabel!
    @IBOutlet weak var lblAirportName: UILabel!
    
    var model1: AirportElement?{
        didSet{
            filterDescription()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func filterDescription()
    {
        lblAirportName.text = model1?.name
        lblCountryName.text = model1?.country
        lblRunwayLength.text = model1?.runwayLength
    }

}
