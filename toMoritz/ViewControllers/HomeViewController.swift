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
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var eosSearchField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    
    func setUI() {
        tableView.dataSource = self
        
        eosSearchField.rx.controlEvent(.editingChanged).asObservable()
            .subscribe ({ [weak self] text in
                print(text)
                self?.checkText(text: self?.eosSearchField.text ?? "")
            }).disposed(by: disposeBag)
    }
    
    
    func checkText(text: String) {
        if text.count == 12 {
            makeRequest(accountName: text)
        }
    }
    
    func makeRequest(accountName: String) {
        let protocolVar = "I have no idea"
        let host = "still no idea"
        let port = "nope"
        
        viewModel.makeRequest(accountName: accountName, withURLString: "\(protocolVar)://\(host):\(port)/v1/chain/get_account")
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

