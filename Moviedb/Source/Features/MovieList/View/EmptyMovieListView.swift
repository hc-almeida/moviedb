//
//  EmptyMovieListView.swift
//  Moviedb
//
//  Created by Hellen on 03/10/21.
//

import UIKit
import SnapKit

class EmptyMovieListView: UIView {
    
    // MARK: - User Interface Components
    
    private lazy var logo: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "not-found")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.text = "Não foi encontrado resultados"
        return label
    }()
    
    private lazy var subtitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18)
        label.text = "Tente uma nova pesquisa"
        return label
    }()
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
}

// MARK: - ViewCodeProtocol Extension
extension EmptyMovieListView: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(logo)
        addSubview(title)
        addSubview(subtitle)
    }
    
    func setupConstraints() {
        logo.snp.makeConstraints { make in
            make.width.height.equalTo(128)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(16)
        }
        
        title.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.top.equalTo(logo.snp.bottom).offset(8)
        }
        
        subtitle.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
            make.top.equalTo(title.snp.bottom).offset(8)
        }
    }
}
