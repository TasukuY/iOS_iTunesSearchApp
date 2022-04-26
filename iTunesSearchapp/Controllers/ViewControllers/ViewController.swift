//
//  ViewController.swift
//  iTunesSearchapp
//
//  Created by Tasuku Yamamoto on 4/26/22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var resultsLabel: UILabel!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBActions
    @IBAction func searchPressed(_ sender: Any) {
        guard let term = searchTextField.text else { return }
        
        SearchResultController.searchResultsForSearchTerm(searchTerm: term) { [weak self] results in
            if let searchResult = results,
               let firstResult = searchResult.first {
               DispatchQueue.main.async {
                   self?.resultsLabel.text = "\(firstResult.trackName) - \(firstResult.artistName)"
               }
            }
        }
    }

}//End of class
