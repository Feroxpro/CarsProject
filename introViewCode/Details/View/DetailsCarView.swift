//
//  DetailsCarView.swift
//  introViewCode
//
//  Created by Felipe Domingos on 26/11/22.
//

import UIKit
import MapKit

class DetailsCarView: UIView {
    

    lazy var carsDetailsImageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var idDetailsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    lazy var nameDetailsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    lazy var typeDetailsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    lazy var descDetailsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    lazy var mapLocation: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.overrideUserInterfaceStyle = .light
        return map
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSubViews()
        self.setUpConstraints()
        
    }
    
    private func configSubViews() {
        self.addSubview(self.carsDetailsImageView)
        self.addSubview(self.idDetailsLabel)
        self.addSubview(self.nameDetailsLabel)
        self.addSubview(self.typeDetailsLabel)
        self.addSubview(self.descDetailsLabel)
        self.addSubview(self.mapLocation)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addDataDetails(data: CarModel) {
        self.carsDetailsImageView.downloaded(from: data.urlFoto ?? "")
        self.nameDetailsLabel.text = data.nome
    }
    
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.carsDetailsImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            self.carsDetailsImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.carsDetailsImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -200),
            self.carsDetailsImageView.heightAnchor.constraint(equalToConstant: 150),
            
            self.idDetailsLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 55),
            self.idDetailsLabel.leadingAnchor.constraint(equalTo: self.carsDetailsImageView.trailingAnchor, constant: 10),
            self.idDetailsLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            self.nameDetailsLabel.topAnchor.constraint(equalTo: self.idDetailsLabel.bottomAnchor, constant: 20),
            self.nameDetailsLabel.leadingAnchor.constraint(equalTo: self.carsDetailsImageView.trailingAnchor, constant: 10),
            self.nameDetailsLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            self.typeDetailsLabel.topAnchor.constraint(equalTo: self.nameDetailsLabel.bottomAnchor, constant: 20),
            self.typeDetailsLabel.leadingAnchor.constraint(equalTo: self.carsDetailsImageView.trailingAnchor, constant: 10),
            self.typeDetailsLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            self.descDetailsLabel.topAnchor.constraint(equalTo: self.carsDetailsImageView.bottomAnchor, constant: 20),
            self.descDetailsLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.mapLocation.topAnchor.constraint(equalTo: self.descDetailsLabel.bottomAnchor, constant: 20),
            self.mapLocation.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    func setData(cars: CarsModel) {
        setData(cars: cars)
    }
}
