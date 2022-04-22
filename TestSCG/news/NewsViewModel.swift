import Foundation
import UIKit

protocol PNewsViewModel{

    var newsView:PNewsViewController?{ get set}
    
    func getData()
    func gotoDetail(_ detail:Article)
    
}

class NewsViewModel:PNewsViewModel{

    
    var _apphel = AppHelper()
    var newsView: PNewsViewController?
    
    
    func getData() {
        
        let url = "everything?q=apple&from=2022-04-19&to=2022-04-19&sortBy=popularity"
        _apphel.getJSON(url) { data in
            let myData = try! JSONDecoder().decode(NewsEntity.self, from: data)
            self.newsView?.setNews(myData)
        } failure: {  error in
            self.newsView?.setError(error)
        }

    }
    
    func gotoDetail(_ detail: Article) {
        self.newsView?.gotoDetail(detail)
    }
    
    
}

