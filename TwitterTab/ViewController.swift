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
  
  //private var tabVCs = [UIViewController]()
  private var tabVCs: [UIViewController] {
    let foryouVC = ForYouViewController()
    foryouVC.title = "For you"
    let trendingVC = TrendingViewController()
    trendingVC.title = "Tranding"
    let newsVC = NewsTopViewController()
    newsVC.title = "News"
    let sportsVC = SportsViewController()
    sportsVC.title = "Sports"
    let entertainmentVC = EntertainmentViewController()
    entertainmentVC.title = "Entertainment"
    return [foryouVC, trendingVC, newsVC, sportsVC, entertainmentVC]
  }
  
//  private var b: BarType = {
//    let bar = BarType()
//    //bar.heightAnchor.constraint(equalToConstant: 40)
//    bar.layout.contentMode = .intrinsic
//    bar.backgroundView.style = .flat(color: .white)
//    bar.indicator.backgroundColor = .black
//    bar.indicator.weight = .custom(value: 3)
//    bar.layout.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
//    bar.buttons.customize { button in
//      button.selectedFont = .boldSystemFont(ofSize: 13)
//      button.unselectedFont = .systemFont(ofSize: 13)
//      button.font = .systemFont(ofSize: 13)
//      button.selectedFont = .boldSystemFont(ofSize: 13)
//      button.tintColor = .gray
//      button.selectedTintColor = .black
//    }
//    return bar
//  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.dataSource = self
    let bar = TMBar.ButtonBar()
    bar.layout.contentMode = .intrinsic
    bar.layout.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    bar.backgroundView.style = .flat(color: .black)
    bar.indicator.backgroundColor = .blue
    bar.indicator.weight = .custom(value: 3)
    //bar.indicator.overscrollBehavior = .compress
    bar.buttons.customize { button in
      button.selectedFont = .boldSystemFont(ofSize: 13)
      button.font = .boldSystemFont(ofSize: 13)
      button.selectedTintColor = .white
      button.tintColor = .white
    }
    self.addBar(bar, dataSource: self, at: .top)
    //self.reloadData()
  }
}

extension ViewController: PageboyViewControllerDataSource {
  func numberOfViewControllers(in pageboyViewController: Pageboy.PageboyViewController) -> Int {
    return tabs.count
  }
  
  func viewController(for pageboyViewController: Pageboy.PageboyViewController, at index: Pageboy.PageboyViewController.PageIndex) -> UIViewController? {
    let viewController = ForYouViewController()
    viewController.tabTitle = tabs[index].title
    return viewController
    //return tabVCs[index]
  }
  
  func defaultPage(for pageboyViewController: Pageboy.PageboyViewController) -> Pageboy.PageboyViewController.Page? {
    return nil
  }
}

extension ViewController: TMBarDataSource {
  func barItem(for bar: Tabman.TMBar, at index: Int) -> Tabman.TMBarItemable {
    print("tabs[index].title", tabs[index].title)
    return TMBarItem(title: tabs[index].title)
  }
}

