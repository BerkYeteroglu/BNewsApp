//
//  ViewController.swift
//  BNewsApp
//
//  Created by Berk Yeteroğlu on 4.10.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    private var newsTableViewModel: NewsTableViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        getData()
    }
    
    func getData(){
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json")
        
        WebService().downloadNews(url: url! ) { news in
            if let news = news {
                self.newsTableViewModel = NewsTableViewModel(newsArray: news)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsTableViewModel == nil ? 0 : newsTableViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsCell
        let newsViewModel = self.newsTableViewModel.newsAtIndexPath(indexPath.row)
        cell.titleLabel.text = newsViewModel.title
        cell.storyLabel.text = newsViewModel.story
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

}

