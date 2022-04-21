
import Foundation
import UIKit

protocol PNewsViewController{

    func setNews(_ news:NewsEntity)
    func setError(_ error:String)
}

class NewsViewController:UIViewController,PNewsViewController{
    
    var newsViewModel: PNewsViewModel = NewsViewModel()
    
    @IBOutlet var tb:UITableView?
    var news:[Article] = []
    var _apphel = AppHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.start()
        
        
        // for test
        //test1
        let test1 = Test1()
        test1.run()
        //test2
        let test2 = Test2()
        test2.run()
        
    }

    
    func start()->Void{
        newsViewModel.newsView = self
        newsViewModel.getData()
    }
    
    func setNews(_ newsdata: NewsEntity) {
        //print("============ news \(newsdata)")
        DispatchQueue.main.async {
            self.news = newsdata.articles!
            self.tb?.reloadData()
        }
       
       
    }
    
    func setError(_ error: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "ERROR", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: false, completion: nil)
        }
    }

    
}


extension NewsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellname = "news";
        let cell = tableView.dequeueReusableCell(withIdentifier: cellname) as! NewsTableViewCell
        
        let article = self.news[indexPath.row]
        cell.title?.text = article.title
        cell.desc?.text = article.articleDescription
        cell.date?.text = article.publishedAt
        
        _apphel.setImg(article.urlToImage!) { img in
            cell.img?.image = img
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let article = self.news[indexPath.row]
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "NewsDetailViewController") as! NewsDetailViewController
        vc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        vc.detailData = article
        let navCtrl = UINavigationController(rootViewController: vc)
        present(navCtrl, animated: true)
         
       // print(article)
    }
    
    
}


class NewsTableViewCell:UITableViewCell{
    @IBOutlet weak var img:UIImageView?
    @IBOutlet weak var title:UILabel?
    @IBOutlet weak var desc:UILabel?
    @IBOutlet weak var date:UILabel?
}
