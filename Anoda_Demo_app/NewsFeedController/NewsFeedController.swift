//
//  NewsFeedController.swift
//  Anoda_Demo_app
//
//  Created by Sergey berdnik on 08.07.2020.
//  Copyright © 2020 Sergey berdnik. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
import RxDataSources
import RxSwift
import RxCocoa

class NewsFeedController: UIViewController {

    let viewModel = NewsFeedViewModel()
    lazy var dataSource = rxDataSource()
    private var disposeBag = DisposeBag()
    let tableView: UITableView = .init()
    
    private func rxDataSource() -> RxTableViewSectionedReloadDataSource<TableViewSection<NewsFeed>> {
        return RxTableViewSectionedReloadDataSource<TableViewSection<NewsFeed>>(configureCell: {[unowned self]
              dataSource, tableView, indexPath, item in
              let tableView = tableView
              return self.cellSetup(tableView: tableView, viewModel: item, indexPath: indexPath)
          })
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(tableView)
        setUpBindings()
        navigationSetUp()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tableView.frame = self.view.frame
    }
    
    private func navigationSetUp() {
        self.title = "Anoda app"
        
        let leftButton : UIBarButtonItem = .init(image: UIImage(named: "photo"), style: .plain, target: nil, action: nil)
        self.navigationItem.setLeftBarButton(leftButton, animated: true)
        
        let rightButton : UIBarButtonItem = .init(image: UIImage(named: "sender"), style: .plain, target: nil, action: nil)
        self.navigationItem.setRightBarButton(rightButton, animated: true)
    }
    
    private func configureTableView(){
        tableView.rowHeight = UITableView.automaticDimension

        tableView.register(UINib(nibName: "NewsFeedCell", bundle: nil),
                            forCellReuseIdentifier: "NewsFeedCellViewModel")
        
        tableView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        tableView.allowsSelection = false
    }
    
    private func cellSetup(tableView: UITableView,
                           viewModel: NewsFeed,
                           indexPath: IndexPath) -> UITableViewCell {
        let cell = NewsFeedCell.init()
        let vm = NewsFeedCellViewModel.init(model: viewModel)
        cell.fillUI(model: vm)
        
        cell.viewModel.tapMoreButton.asObservable().subscribe(onNext:{[unowned self] _ in
            self.moreButtonAlert()
            }).disposed(by: disposeBag)
        
        return cell
    }
    
    
    private func setUpBindings(){
            tableView.delegate = nil
        
            tableView.rx
                    .setDelegate(self)
                    .disposed(by: disposeBag)

            tableView.dataSource = nil
        
            viewModel.output.sections
            .asObservable()
            .bind(to: tableView.rx.items(dataSource: rxDataSource()))
            .disposed(by: disposeBag)
    }
}

extension NewsFeedController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    }
    
    private func moreButtonAlert() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let firstAction = UIAlertAction(title: NSLocalizedString("firstAction", comment: ""),
                                         style: .default,
                                         handler: {[unowned self] (action) in
                                            
        })
        actionSheet.addAction(firstAction)
        
        let cancel = UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil)
        actionSheet.addAction(cancel)
        UIApplication.shared.keyWindow?.rootViewController?.present(actionSheet, animated: true, completion: nil)
    }
}


