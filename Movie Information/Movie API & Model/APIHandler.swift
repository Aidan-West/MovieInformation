//
//  APIHandler.swift
//  Movie Information
//
//  Created by Ege on 21.09.2022.
//

import UIKit
import SwiftyJSON

class APIHandler{

    func getMovies(completion: @escaping ([Movie]) -> ()){
        
        var movieArr = [Movie]()
        
        let headers = [
            "X-RapidAPI-Key": "368ec92648msh1a2befdcd1fbb44p154ee9jsn31fa2324e691",
            "X-RapidAPI-Host": "movies-app1.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://movies-app1.p.rapidapi.com/api/movies")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
                
                do{
                    
                    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                    
                   // print(jsonResponse)
                    if let results = jsonResponse["results"] as? [[String : Any]] {
                        
                        for result in results {
                            
                            let movie = Movie()
                            
                            if let year = result["year"] as? String{
                                print(year)
                                movie.year = year
                            }
                            if let title = result["title"] as? String{
                                print(title)
                                movie.title = title
                            }
                            if let desc = result["description"] as? String{
                                print(desc)
                                movie.descMovie = desc
                            }
                            if let rate = result["rating"] as? String{
                                print(rate)
                                movie.rating = rate
                            }
                            if let movImg = result["image"] as? String{
                                print(movImg)
                                movie.movieImg = movImg
                            }
                            
                            movieArr.append(movie)
                        }
                        
                        
                       completion(movieArr)
                    }
                    
                } catch{
                    
                    
                }
            }
        })

        dataTask.resume()
        
    }
}
