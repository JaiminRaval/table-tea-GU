//
//  ApiManager.swift
//  table-tea
//
//  Created by Jaimin Raval on 12/09/24.
//

import Foundation
import Alamofire

class ApiManager {
    
    let urlstr = "https://official-joke-api.appspot.com/jokes/random/25"
    
    
    func fetchJokesAF(completionHandler: @escaping(Result<[JokeModel], Error>) -> Void) {
        
        AF.request(urlstr).responseDecodable(of: [JokeModel].self) { response in
            
            switch response.result {
            
            case .success(let data):
                completionHandler(.success(data))
                
            case .failure(let error):
                completionHandler(.failure(error))
            }
    
        }
    }
    
    
    
    
    
    
    
    
    
    
    
//    MARK: - native api call function
//    func fetchJokes(completion: @escaping(Result<[JokeModel],Error>)-> Void) {
//    
//            let urlstr = "https://official-joke-api.appspot.com/jokes/random/25"
//    
//            if let url = URL(string: urlstr) {
//    
//                let session = URLSession.shared
//    
//                let dataTask = session.dataTask(with: url) { data, response, error in
//    
//                    guard let jokeData = data else { return }
//    
//                    do {
//                        let jsonData = try JSONDecoder().decode([JokeModel].self, from: jokeData)
//                        completion(.success(jsonData))
//                        debugPrint(jsonData)
//                    } catch(let err) {
//                        completion(.failure(err))
//                        debugPrint("error in decoding")
//                    }
//    
//                }
//                dataTask.resume()
//    
//            }
//    
//    
//        }
}


//  Current API: https://official-joke-api.appspot.com/jokes/random/25
//  More similar APIs: https://github.com/15Dkatz/official_joke_api
