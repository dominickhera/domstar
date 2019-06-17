//
//  GreetingsCollectionViewCell.swift
//  domStar
//
//  Created by Dominick Hera on 6/12/19.
//  Copyright © 2019 Dominick Hera. All rights reserved.
//

import UIKit

protocol GreetingsDelegate {
    func refreshGreeting()
}
class GreetingsCollectionViewCell: UICollectionViewCell {
    var delegate: GreetingsDelegate?
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var greetingsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius = 5
        self.layer.cornerRadius = 5
        self.layer.shadowOffset = CGSize(width: 0, height: 5)
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 10
        self.layer.masksToBounds = false
        greetingsLabel.text = DataManager.shared.getGreetingString(name: DataManager.shared.user.name ?? "", birthdate: DataManager.shared.user.birthdate ?? "")
        print("greetings init")
        // Initialization code
    }
}

extension GreetingsCollectionViewCell {
    @IBAction func updateString(_ sender: Any) {
        delegate?.refreshGreeting()
    }
}
