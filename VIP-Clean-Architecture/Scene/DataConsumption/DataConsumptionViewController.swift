//
//  ViewController.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import  UIKit

class DataConsumptionViewController: UIViewController {
    
    var output: DataConsumptionInteractorInput?
    var router: DataConsumptionRouterProtocol?
    
    var vmMain:[(title: String, vms: [DataConsumptionCellVM])] = []
    let tableView = UITableView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    // MARK: - Configurator
    private func configure(configurator: NSBaseConfig = PCRHomeConfigurator.sharedInstance) {
        configurator.configure(viewController: self)
    }
    
    override func viewDidLoad() {
        setupViews()
        output?.getMobileDataConsumption()
    }
    
    func setupViews() {
        view.addSubview(tableView)
        tableView.fill(view)
        setupNavBar()
        setupTableView()
    }
    
    func setupNavBar() {
        title = SPHL.title.localized
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: SPHC.SPHBlue]
    }
    
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = SPHConstants.spacingConstaraint40
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.accessibilityIdentifier = SPHL.tableviewIdentifier.localized
        tableView.backgroundColor = SPHC.white
        tableView.register(DataConsumptionViewHeader.self, forHeaderFooterViewReuseIdentifier: DataConsumptionViewHeader.reuseIdentifier)
        tableView.register(DataConsumptionCell.self, forCellReuseIdentifier: DataConsumptionCell.reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension DataConsumptionViewController: DataConsumptionPresenterOutput {
    
    func displayDataConsumptionList(vm: [(title: String, vms: [DataConsumptionCellVM])]) {
        vmMain = vm
        reloadTableView()
    }
    
    func displayErrorMessage(message: String) {
        showAlert(message: message)
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}

extension DataConsumptionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return vmMain.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return SPHConstants.spacingConstaraint40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: DataConsumptionViewHeader.reuseIdentifier) as? DataConsumptionViewHeader else { return UIView()}
        header.vm = vmMain[safe: section]?.title
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vmMain[safe: section]?.vms.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DataConsumptionCell.reuseIdentifier, for: indexPath) as? DataConsumptionCell else { return UITableViewCell() }
        cell.cellVM = vmMain[safe: indexPath.section]?.vms[safe: indexPath.row]
        cell.delegate = self
        setupActivityIndicator(indexPath: indexPath)
        return cell
    }
    
    func setupActivityIndicator(indexPath: IndexPath) {
        if(indexPath.row == (self.vmMain[indexPath.section].vms.count-1)) {
            let indicator = UIActivityIndicatorView(style: .medium)
            indicator.startAnimating()
            indicator.hidesWhenStopped = true
            indicator.frame = CGRect(x: 0.0, y: 0.0,
                                     width: tableView.bounds.width,
                                     height: SPHConstants.spacingConstaraint40)
            self.tableView.tableFooterView = indicator
            self.tableView.tableFooterView?.isHidden = false
        } else {
            self.tableView.tableFooterView?.isHidden = true
        }
    }
}

extension DataConsumptionViewController {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if(scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
            output?.getMobileDataConsumption()
        }
    }
    
    private func showAlert(message : String) {
        let alert = UIAlertController(title: SPHL.title.localized, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: SPHL.okay.localized, style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension DataConsumptionViewController: DataConsumptionCellDelagate {
    
    func downButtonTapped() {
        showAlert(message: SPHL.decreasedMessage.localized)
    }
}
