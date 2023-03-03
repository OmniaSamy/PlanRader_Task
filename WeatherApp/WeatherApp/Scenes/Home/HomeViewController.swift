//
//  HomeViewController.swift
//  WeatherApp
//
//  Created by Omnia on 25/02/2023.
//

import UIKit

class HomeViewController: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: HomeViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpScreenDesign()
    }

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private
extension HomeViewController {
    
    private func setUpScreenDesign() {
        self.title = "Cities"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: CitiesTableViewCell.className, bundle: nil),
                           forCellReuseIdentifier: CitiesTableViewCell.className)

    }
    
}

// MARK: - TableView DataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.citiesList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CitiesTableViewCell.className,
                                                       for: indexPath) as? CitiesTableViewCell else {
            return UITableViewCell()
        }
        cell.accessoryType = .detailButton
        guard let city = viewModel?.citiesList[indexPath.row] else {
            return UITableViewCell()
        }
        cell.bind(city: city)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// MARK: - TableView Delegate
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let city = viewModel?.citiesList[indexPath.row] else { return }
        let viewModel = DetailsViewModel(selectedCity: city)
        let viewController = DetailsViewController(viewModel: viewModel)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
