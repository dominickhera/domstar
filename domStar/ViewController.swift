//
//  ViewController.swift
//  domStar
//
//  Created by Dominick Hera on 6/12/19.
//  Copyright © 2019 Dominick Hera. All rights reserved.
//

import UIKit
import CenteredCollectionView

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private let itemHeight: CGFloat = 300
    private let lineSpacing: CGFloat = 40
    private let xInset: CGFloat = 10
    private let topInset: CGFloat = 10
    let cellPercentWidth: CGFloat = 0.8
    var dataCellIdentifier = "DataCollectionCollectionViewCell"
    var greetingCellIdentifier = "GreetingsCollectionViewCell"
    var reloadFlag = false
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let dataNib = UINib(nibName: dataCellIdentifier, bundle: nil)
        collectionView.register(dataNib, forCellWithReuseIdentifier: dataCellIdentifier)
        let greetingNib = UINib(nibName: greetingCellIdentifier, bundle: nil)
        collectionView.register(greetingNib, forCellWithReuseIdentifier: greetingCellIdentifier)
        guard let layout = collectionView.collectionViewLayout as? CenteredCollectionViewFlowLayout else { return }
        layout.minimumLineSpacing = lineSpacing
        let itemWidth = ( UIScreen.main.bounds.width - 3 * xInset)
        layout.itemSize = CGSize(width: itemWidth, height: 300)
        collectionView.collectionViewLayout.invalidateLayout()
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.reloadData()
        self.hideKeyboardWhenTappedAround()
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, DataCollectionDelegate, GreetingsDelegate {
    func refreshGreeting() {
        let tempIndexPath = IndexPath(row: 1, section: 0)
                let tempCell = collectionView.dequeueReusableCell(withReuseIdentifier: greetingCellIdentifier, for: tempIndexPath) as! GreetingsCollectionViewCell
                tempCell.greetingsLabel.text = DataManager.shared.getGreetingString(name: DataManager.shared.user.name ?? "", birthdate: DataManager.shared.user.birthdate ?? "")
    }
    
    func showResults() {
        let tempIndexPath = IndexPath(row: 1, section: 0)
        self.collectionView.reloadData()
        self.collectionView.scrollToItem(at: tempIndexPath, at: .right, animated: true)
        refreshGreeting()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dataCellIdentifier, for: indexPath) as! DataCollectionCollectionViewCell
            cell.delegate = self
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: greetingCellIdentifier, for: indexPath) as! GreetingsCollectionViewCell
            return cell
        default:
            break
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: dataCellIdentifier, for: indexPath) as! DataCollectionCollectionViewCell
        return cell
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:    #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
