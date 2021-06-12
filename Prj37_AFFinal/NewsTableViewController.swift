//
//  NewsTableViewController.swift
//  Prj37_AFFinal
//
//  Created by ИГОРЬ on 12/06/2021.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class NewsTableViewController: UITableViewController {
    
    var newsArticlesArray = [NewsModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.downloadNews {
            self.tableView.reloadData()
        }
    }
    
    func downloadNews(completion: @escaping GetComplete) {
        AF.request(apiURL, method: .get).responseJSON { (response) in
            switch response.result {
            case .success:
                guard let unwrResponse = response.value else {return}
                let json = JSON(unwrResponse)["articles"]
                
                for i in 0..<json.count {
                    let newsArticle = NewsModel(newsDictionary: json[i])
                    self.newsArticlesArray.append(newsArticle)
                }
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }

    
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArticlesArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsTableViewCell

        let cellTitle = newsArticlesArray[indexPath.row].title
        cell.newsTitle.text = cellTitle
        let cellImgUrl = newsArticlesArray[indexPath.row].urlToImage
        guard let unwrImgURL = URL(string: cellImgUrl) else {return cell}
        cell.newsImage.sd_setImage(with: unwrImgURL, placeholderImage: nil, options: [.continueInBackground, .progressiveLoad], completed: nil)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}
