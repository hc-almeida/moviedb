//
//  MovieListView.swift
//  Moviedb
//
//  Created by Hellen on 02/08/21.
//

import UIKit
import SnapKit

class MovieListView: UIView {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private var movieList: [Movie] = []
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setup(_ movieList: [Movie]) {
        self.movieList = movieList
        tableView.reloadData()
    }
}
extension MovieListView: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
    func setupComponents() {
        backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        MovieCell.registerOn(tableView)
    }
}

extension MovieListView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = MovieCell.identifier
        
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: identifier, for: indexPath) as? MovieCell
        else { return UITableViewCell() }
        
        cell.setup(movie: movieList[indexPath.item])
        
        return cell
    }
}

