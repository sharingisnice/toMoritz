//
//  ViewController.swift
//  toMoritz
//
//  Created by Mert Ejder on 21.05.2022.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    
    let viewModel = HomeViewModel()
    
    @IBOutlet weak var eosSearchField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    
    func setUI() {
        tableView.dataSource = self
        eosSearchField.delegate = self
        
        eosSearchField.rx.controlEvent(.editingChanged)
            .withLatestFrom(eosSearchField.rx.text.orEmpty)
            .subscribe { text in
                print(text)
                
            }
       
    }
    
    
}


extension HomeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.infoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //I couldn't find the time to create a custom cell and since we only need a simple text about user info, it didn't seem that important
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.infoArray[indexPath.row]
        
        return cell
    }
    
    
}

