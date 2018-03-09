//
//  NYArticleDownloadManager.swift
//  MostViewedInNYTimes
//
//  Created by apple on 08/03/18.
//  Copyright © 2018 Soham Paul. All rights reserved.
//

import Foundation



struct NYArticlesJson: Decodable {
    let results: [NYArticles]
}

struct NYArticles: Codable {
    let title: String?
    let byline: String?
    let published_date: String?
    let url: URL?
    
    private enum CodingKeys: String, CodingKey {
        case title
        case byline
        case published_date
        case url
    }
}



class NYArticleDownloadManager: NSObject  {
    var articleObjects = [Any]()

    static var shared = NYArticleDownloadManager()
    
    
    override private init() {
        super.init()
    }
    
    
    func startDownloadWithUrl(serverUrl:String, withCompletionHandler:@escaping (_ result:NSArray) -> Void) {

        guard let articleUrl = URL(string:serverUrl) else { return }
        
        URLSession.shared.dataTask(with: articleUrl) { (data, response, error) in
            
            guard let data = data else { return }
            do {
                
                let NYArticlesJsonData =  try JSONDecoder().decode(NYArticlesJson.self, from: data)
                for article in NYArticlesJsonData.results {
                    self.articleObjects.append(article)
                }
                withCompletionHandler(self.articleObjects as NSArray)

                
            } catch let err {
                print("Err", err)
            }
            }.resume()
        
        
        withCompletionHandler(self.articleObjects as NSArray)


    }
    
    
}
