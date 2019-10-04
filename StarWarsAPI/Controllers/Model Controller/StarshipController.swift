//
//  StarshipController.swift
//  StarWarsAPI
//
//  Created by Zebadiah Watson on 10/3/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

import Foundation

class StarshipController {
    
    let baseURL = URL(string: StarshipConstants.baseURL)
    
    func fetchStarships(with searchTerm: String, completion: @escaping ([Starship]) -> Void) {
        
        guard let url = baseURL else { completion([]); return }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        let queryItem = URLQueryItem(name: StarshipConstants.queryItem1, value: searchTerm)
        
        urlComponents?.queryItems = [queryItem]
        
        guard let finalURL = urlComponents?.url else {
            completion([]); return }
        
        let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("error")
            }
            
            guard let data = data else { completion([]); return }
            do {
                let decodedwhatever = try JSONDecoder().decode(TopLevelDectionary.self, from: data)
                completion(decodedwhatever.starships)
            } catch {
                completion([])
            }
        }
        dataTask.resume()
    }
    
    
    func getFilm(filmURL: String , completion: @escaping (Film?) -> Void) {
        //create url
        guard let url = URL(string: filmURL) else { completion(nil); return }
        //start dataTask
        let filmRequest = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("error")
            }
            
            guard let data = data else { completion(nil); return }
            do {
                let film = try JSONDecoder().decode(Film.self, from: data)
                completion(film)
            } catch {
                completion(nil)
            }
        }
        filmRequest.resume() //dont forget to resume
    }
    
    
    
    
}// End Of Class
