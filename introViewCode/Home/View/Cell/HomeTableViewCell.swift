//
//  CarDetailTableViewCell.swift
//  introViewCode
//
//  Created by Felipe Domingos on 21/11/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let indentifier:String = "HomeTableViewCell"
    
    lazy var carImageView:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var nameLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubView()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubView() {
        self.contentView.addSubview(self.carImageView)
        self.contentView.addSubview(self.nameLabel)
    }
    
    public func addData(data: CarModel){
        self.carImageView.downloaded(from: data.urlFoto ?? "")
        self.nameLabel.text = data.nome
     }
    
    private func setUpConstraints(){
        NSLayoutConstraint.activate([
            self.carImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.carImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.carImageView.heightAnchor.constraint(equalToConstant: 100),
            self.carImageView.widthAnchor.constraint(equalToConstant: 100),
            
            self.nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.carImageView.trailingAnchor, constant: 20),
            self.nameLabel.heightAnchor.constraint(equalToConstant: 80),
            self.nameLabel.widthAnchor.constraint(equalToConstant: 300),
        ])
        
    }
}

