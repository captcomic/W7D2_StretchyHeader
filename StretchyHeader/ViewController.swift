//
//  ViewController.swift
//  StretchyHeader
//
//  Created by Fariha on 7/17/18.
//  Copyright © 2018 Bootcamp. All rights reserved.
//

import UIKit

private let kTableHeaderHeight: CGFloat = 300.0
private let kTableHeaderCutAway: CGFloat = 80.0

class ViewController: UITableViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var headerView: UIView!
    var headerMaskLayer: CAShapeLayer!
    
    var newsItems = [NewsItem]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newsItem1 = NewsItem(category: .world, headline: "Climate change protests, divestments meet fossil fuels realities")
        let newsItem2 = NewsItem(category: .europe, headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'")
        let newsItem3 = NewsItem(category: .middleEast, headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible")
        let newsItem4 = NewsItem(category: .africa, headline: "Nigeria says 70 dead in building collapse, questions South Africa victim claim")
        let newsItem5 = NewsItem(category: .asiaPacific, headline: "Despite UN ruling, Japan seeks backing for whale hunting")
        let newsItem6 = NewsItem(category: .americas, headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria")
        let newsItem7 = NewsItem(category: .world, headline: "South Africa in $40 billion deal for Russian nuclear reactors")
        let newsItem8 = NewsItem(category: .europe, headline: "'One million babies' created by EU student exchanges")
        
        newsItems += [newsItem1, newsItem2, newsItem3, newsItem4, newsItem5, newsItem6, newsItem7, newsItem8]

        self.navigationController?.isNavigationBarHidden = true
        
        // STRETCHY HEADER
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        
        //tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        //tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        
        
        let effectiveHeight = kTableHeaderHeight - (kTableHeaderCutAway/2)
        tableView.contentInset = UIEdgeInsets(top: effectiveHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -effectiveHeight)
        
        
        // STRETCHY HEADER CUTAWAY
        headerMaskLayer = CAShapeLayer()
        headerMaskLayer.fillColor = UIColor.black.cgColor
        
        headerView.layer.mask = headerMaskLayer
        
        updateHeaderView()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.estimatedRowHeight = UITableViewAutomaticDimension
        
        // DATE LABEL
        let dateFormatter = DateFormatter()
        //dateFormatter.dateStyle = .long
        dateFormatter.dateFormat = "MMMM dd"
        dateLabel.text = dateFormatter.string(from: Date())
 
    }
    
    override var prefersStatusBarHidden: Bool {
        //return 5
        return true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! NewsItemCell
        
        let newsItem = newsItems[indexPath.row]
        
        cell.newsItem = newsItem
        
        /*
        cell.categoryLabel.text = newsItem.category.toString()
        cell.categoryLabel.textColor = newsItem.category.toColor()
        cell.headlineLabel.text = newsItem.headline
        */

        return cell
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    func updateHeaderView() {
        /*
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if (tableView.contentOffset.y < -kTableHeaderHeight) {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        */
        
        
        let effectiveHeight = kTableHeaderHeight - (kTableHeaderCutAway/2)
        
        var headerRect = CGRect(x: 0, y: -effectiveHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if (tableView.contentOffset.y < -effectiveHeight) {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y + (kTableHeaderCutAway/2)
        }
        
        headerView.frame = headerRect
        
        // STRETCHY HEADER CUTAWAY
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: headerRect.width, y: 0))
        path.addLine(to: CGPoint(x: headerRect.width, y: headerRect.height))
        path.addLine(to: CGPoint(x: 0, y: headerRect.height - kTableHeaderCutAway))
        headerMaskLayer?.path = path.cgPath
    }
}

