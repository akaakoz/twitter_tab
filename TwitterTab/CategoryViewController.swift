//
//  CategoryViewController.swift
//  TwitterTab
//
//  Created by Akiya Ozawa on R 4/10/16.
//

import UIKit

class CategoryViewController: UIViewController {
  
  var tab: Tab? {
    didSet {
      label.text = tab?.title
    }
  }

  let label: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 13)
    label.textColor = .white
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0.0868801102, green: 0.1225979105, blue: 0.1686807573, alpha: 1)
    view.addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
}
