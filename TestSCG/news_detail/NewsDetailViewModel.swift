//
//  NewsDetailViewModel.swift
//  TestSCG
//
//  Created by kk on 20/4/2565 BE.
//

import Foundation

protocol PNewsDetailViewModel{
    var newsDetailView:PNewsDetailViewController?{ get set }
    
    func setDetail(_ data:Article)
}

class NewsDetailViewModel:PNewsDetailViewModel{
    var newsDetailView: PNewsDetailViewController?
    
    func setDetail(_ data: Article) {
        self.newsDetailView?.setDetail(data)
    }
    
    
}
