//
//  ViewController.swift
//  TwitterTab
//
//  Created by Akiya Ozawa on R 4/10/10.
//

import UIKit
import Tabman
import Pageboy

enum Tab: CaseIterable {
  case forYou
  case trending
  case news
  case sports
  case entertainement
  
  var title: String {
    switch self {
    case .forYou:
      return "For you"
    case .trending:
      return "Trending"
    case .news:
      return "News"
    case .sports:
      return "Sports"
    case .entertainement:
      return "Entertainment"
    }
  }
}

class ViewController: TabmanViewController {

  private var tabs = Tab.allCases
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Create tab bar
    let bar = TMBar.ButtonBar()
    bar.layout.contentMode = .intrinsic
    bar.layout.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    bar.backgroundView.style = .flat(color :#colorLiteral(red: 0.0868801102, green: 0.1225979105, blue: 0.1686807573, alpha: 1))
    bar.indicator.backgroundColor = #colorLiteral(red: 0.09939720482, green: 0.6090072989, blue: 0.9398307204, alpha: 1)
    bar.indicator.weight = .custom(value: 3)
    bar.buttons.customize { button in
      button.selectedFont = .boldSystemFont(ofSize: 15)
      button.font = .boldSystemFont(ofSize: 15)
      button.selectedTintColor = .white
      button.tintColor = .gray
    }
    // Register datasource
    self.dataSource = self
    // Add bar to the top
    self.addBar(bar, dataSource: self, at: .top)
  }
}

extension ViewController: PageboyViewControllerDataSource {
  func numberOfViewControllers(in pageboyViewController: Pageboy.PageboyViewController) -> Int {
    return tabs.count
  }
  
  func viewController(for pageboyViewController: Pageboy.PageboyViewController, at index: Pageboy.PageboyViewController.PageIndex) -> UIViewController? {
    let viewController = CategoryViewController()
    viewController.tab = tabs[index]
    return viewController
  }
  
  func defaultPage(for pageboyViewController: Pageboy.PageboyViewController) -> Pageboy.PageboyViewController.Page? {
    return nil
  }
}

extension ViewController: TMBarDataSource {
  func barItem(for bar: Tabman.TMBar, at index: Int) -> Tabman.TMBarItemable {
    return TMBarItem(title: tabs[index].title)
  }
}

