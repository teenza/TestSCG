//
//  NewsDetailViewController.swift
//  TestSCG
//
//  Created by kk on 20/4/2565 BE.
//

import Foundation
import UIKit

protocol PNewsDetailViewController{
    func setDetail(_ data:Article)
}

class NewsDetailViewController:UIViewController,PNewsDetailViewController{
   
    var newsDetailViewModel:PNewsDetailViewModel = NewsDetailViewModel()
    
    @IBOutlet weak var img1:UIImageView?
    @IBOutlet weak var titletxt:UILabel?
    @IBOutlet weak var desc:UILabel?
    @IBOutlet weak var date:UILabel?
    
    var detailData:Article?
    var _apphel = AppHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.start()
    }
    
    func start()->Void{
        newsDetailViewModel.newsDetailView = self
        newsDetailViewModel.setDetail(detailData!)
    }
    
    func setDetail(_ data: Article) {
        titletxt?.text = data.title
        desc?.text = data.content
        date?.text = data.publishedAt
        _apphel.setImg(data.urlToImage ?? "") { img in
            self.img1?.image = img
        }
    }
    

    
}
