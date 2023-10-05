//
//  NewsViewModel.swift
//  BNewsApp
//
//  Created by Berk Yeteroğlu on 5.10.2023.
//

import Foundation

struct NewsTableViewModel{
    let newsArray: [News]
}

extension NewsTableViewModel {
    func numberOfRowsInSection() -> Int{
        return self.newsArray.count
    }
    
    func newsAtIndexPath(_ index: Int) -> NewsViewModel {
        let news = self.newsArray[index]
        return NewsViewModel(news: news)
    }
}

struct NewsViewModel{
    
    let news: News
    
    var title: String{
        return self.news.title
    }
    
    var story: String{
        return self.news.story
    }
}
