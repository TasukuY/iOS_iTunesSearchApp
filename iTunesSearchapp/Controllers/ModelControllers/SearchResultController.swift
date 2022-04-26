//
//  SearchResultController.swift
//  iTunesSearchapp
//
//  Created by Tasuku Yamamoto on 4/26/22.
//

import Foundation

class SearchResultController {
    
    //MARK: - Helper Methods
    static func searchResultsForSearchTerm(searchTerm: String, completion: @escaping (_ results: [SearchResult]?) -> Void){
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)"
        guard let url = URL(string: urlString) else { return }
        
        fetchJSONatURL(url: url) { json in
            guard let json = json,
                  let allResults = json["results"] as? [[String : AnyObject]]
            else { return }
            
            let searchResults = allResults.flatMap({ return SearchResult(json: $0)})
            completion(searchResults)
        }
        
    }//End of function
    
    static func fetchJSONatURL(url: URL, completion: @escaping (_ json: [String : AnyObject]?) -> Void){
        //1. Prepare URL -> get the URL as the argument of this function
        //2. Contact Server (Data Task)
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                //3. Handle Errors
                print("Error downloading data: \(error.localizedDescription)")
            }else if let data = data {
                //4. Check for Data
                //5. Decode Data from json
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] {
                        completion(json)
                    }
                }catch let jsonError{
                    print("Error decoding JSON: \(jsonError.localizedDescription)")
                }
            }
            
        }
        task.resume()
    }//End of function
    
}//End of class


