//
//  MessageCell.swift
//  ParseLab
//
//  Created by Oscar Bonilla on 9/27/17.
//  Copyright © 2017 Phan, Ngan. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!

    var message: Message! {
        didSet {
            messageLabel.text = message.text
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
