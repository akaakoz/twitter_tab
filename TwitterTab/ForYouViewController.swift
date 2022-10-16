//
//  ForYouViewController.swift
//  TwitterTab
//
//  Created by Akiya Ozawa on R 4/10/16.
//

import UIKit

class ForYouViewController: UIViewController {
  
  var tabTitle: String? {
    didSet {
      label.text = tabTitle
    }
  }
  
  let label: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 13)
    label.textColor = .black
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
}
