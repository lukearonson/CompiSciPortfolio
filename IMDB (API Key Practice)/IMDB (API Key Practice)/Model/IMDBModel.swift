//
//  IMDBModel.swift
//  IMDB (API Key Practice)
//
//  Created by Luke Aronson on 1/31/23.
//

import Foundation

func loadData(searchTerm:String, completion:@escaping (IMDBSearch) -> Void){
    let urlEncodeSearchTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!
    
    var request = URLRequest(url: URL(string: "https://imdb-api.com/en/API/SearchMovie/k_4ah065pl/" + urlEncodeSearchTerm)!)
    request.httpMethod = "GET"
     
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        print(String(describing: error))
        return
      }
        let movies = try! JSONDecoder().decode(IMDBSearch.self, from: data)

        //print(String(data: data, encoding: .utf8)!)
        //print(movies)
        
        
        completion(movies)
    
    }
     
    task.resume()

    
}
