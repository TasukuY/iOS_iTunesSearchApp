//
//  SearchResult.swift
//  iTunesSearchapp
//
//  Created by Tasuku Yamamoto on 4/26/22.
//

import Foundation

class SearchResult {
    
    //MARK: - Properties
    var artistName = ""
    var trackName = ""
    var itemDescription = ""
    var trackPrice = 0.00
    
    init?(json: [String: AnyObject]) {
        guard let artistName = json["artistName"] as? String,
              let trackName = json["trackName"] as? String
        else { return }
        
        let itemDescription = json["description"]
        let price = json["trackPrice"]
        
        self.artistName = artistName
        self.trackName = trackName
        if let trackP = price as? Double {
            self.trackPrice = trackP
        }
        if let description = itemDescription as? String {
            self.itemDescription = description
        }
    }
    
}//End of class
