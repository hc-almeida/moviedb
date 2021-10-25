//
//  CastCell.swift
//  Moviedb
//
//  Created by Hellen on 13/09/21.
//

import UIKit
import MDCore

class CastCell: UICollectionViewCell {
    
    // MARK: - User Interface Components
    
    private lazy var contentCard: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .systemBackground
        return view
    }()
    
    private lazy var cardView: UICardView = {
        let cardView = UICardView(frame: .zero)
        cardView.cornerRadius = 10
        cardView.clipsToBounds = true
        return cardView
    }()
    
    private lazy var castImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    private lazy var nameActor: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var characterActor: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    // MARK: - Public Properties
    
    static let identifier = String(describing: CastCell.self)
    
    // MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - View Lifecycle
    
    override func prepareForReuse() {
        clearForReuse()
    }
    
    // MARK: - Public Functions
    
    func setup(cast: Cast?) {
        guard let cast = cast else { return }
        
        if let profilePath = cast.profilePath {
            castImage.load(url: MovieAPI.build(image: profilePath, size: .w500))
        } else {
            castImage.image = UIImage(named: "imageNotFound")
        }
        
        nameActor.text = cast.name
        characterActor.text = cast.character
    }
    
    // MARK: - Private Functions
    
    private func clearForReuse() {
        castImage.image = nil
        castImage.cancel()
    }
}

// MARK: - ViewCodeProtocol Extension

extension CastCell: ViewCodeProtocol {
    
    func setupSubviews() {
        addSubview(contentCard)
        contentCard.addSubview(cardView)
        cardView.addSubview(castImage)
        contentCard.addSubview(nameActor)
        contentCard.addSubview(characterActor)
    }
    
    func setupConstraints() {
        contentCard.snp.makeConstraints { make in
            make.left.top.equalToSuperview()
            make.right.bottom.equalToSuperview()
        }
        
        cardView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.right.equalToSuperview()
            make.height.equalTo(130)
            make.width.equalTo(90)
        }
        
        castImage.snp.makeConstraints { make in
            make.left.top.right.bottom.equalToSuperview()
        }
        
        nameActor.snp.makeConstraints { make in
            make.top.equalTo(cardView.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
        }
        
        characterActor.snp.makeConstraints { make in
            make.top.equalTo(nameActor.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
        }
    }
}
