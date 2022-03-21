//
//  NetworkManager.swift
//  NewsApp
//
//  Created by iYezan on 18/03/2022.
//

import Foundation

struct Secret {
    static let secretKey: String = "7f678d21f1c4472ebf3eaa7d7ae8abb9"
}

final class NetworkManager {
    static let shared = NetworkManager()
    // Struct: Constants
    struct Constants {
        static let topHeadlinesURL = URL(
             string: "https://newsapi.org/v2/top-headlines?country=in&apiKey=\(Secret.secretKey)"
        )
        static let searchURLString =  "https://newsapi.org/v2/everything?sortBy=popularity&apiKey=\(Secret.secretKey)&q="
    }
    
    private init() {}
    
    // Func: getTopStories
    public func getTopStories(completion: @escaping (Result<[Article],Error>) -> Void){
        //Get URL (guarded)
        guard let url = Constants.topHeadlinesURL else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                print(error.localizedDescription)
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    completion(.success(result.articles))
                    
                }
                catch{
                    completion(.failure(error))
//                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
    // Function: searchWithText
    public func search(with query: String, completion: @escaping (Result<[Article],Error>) -> Void){
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        let urlString = Constants.searchURLString + query
        guard  let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data{
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    completion(.success(result.articles))
                } catch {
//                    print("Error in Response")
                    print(error)
                }
            }
        }
        task.resume()
    }
}
