//
//  ViewController.swift
//  GoRead
//
//  Created by zhangdu_imac on 2020/12/2.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    private let peopleCellIdentiferKey = "PeopleCellIdentifier"
    
    // MARK: Lazy var
    private lazy var tableView: UITableView! = {
        let tempTable = UITableView.init(frame: view.bounds, style: .plain)
        tempTable.register(UITableViewCell.self, forCellReuseIdentifier: peopleCellIdentiferKey)
        return tempTable
    }()
    
    // MARK:
    // ViewModel
    let peopleListViewModel = PeopleListViewModel()
    
    // disposeBag
    let disposeBag = DisposeBag()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = "GoRead"
        
        view.addSubview(tableView)
        peopleListViewModel.peopleList.bind(to: tableView.rx.items(cellIdentifier: peopleCellIdentiferKey)) {_, people, cell in
            cell.textLabel?.text = people.name
            cell.detailTextLabel?.text = String(people.age)
        }.disposed(by: disposeBag)
        
        networkReachable()
        
    }

}

