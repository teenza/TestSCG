
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
        
        //let test2 = Test2()
        //test2.run()
        
        //let data1:[Int] = [3,5,6]
        let data1:[Int] = [1,3,5,7,9]
        //let data1:[Int] = [3,6,8,1,5,10,1,7]
        var oi = 0
        var newArr = [Int:Int]()
        for (index, element) in data1.enumerated(){
            oi = (oi + element)
            
                newArr[oi] = index
            
           
           // print("== \(index) \(element) \(oi)")
        }
        //print("== \(newArr)")
        var oi_r = 0
        var newArrR = [Int:Int]()
        for (index, element) in data1.reversed().enumerated(){
            oi_r = (oi_r + element)
            let new_index = ((data1.count-1) - index)
            
                newArrR[oi_r] = new_index
            
            //print("== \((data1.count-1) - index) \(element) \(oi_r)")
        }
       // print("== \(newArrR)")
        
        var result = 0
        for (index, element) in newArr{
            
            if((newArrR[index]) != nil){
                //print("== \(newArrR[index]) \(index)")
                result = newArrR[index] ?? 0
                print("==\(data1) middle index is \(result)")
                return
            }
        }
        
        
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
