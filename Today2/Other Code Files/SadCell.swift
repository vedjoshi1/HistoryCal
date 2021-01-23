//
//  SadCell.swift
//  Today2
//
//  Created by Ved Joshi on 12/23/20.
//

import UIKit

class SadCell: UITableViewCell {
    var count = 0;
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
       // let noProblemFrame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        //frame = noProblemFrame
        // Initialization code
    }
    
     
    override func prepareForReuse() {
        
        label.text = ""
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
