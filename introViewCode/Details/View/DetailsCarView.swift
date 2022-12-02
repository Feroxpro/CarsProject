//
//  DetailsCarView.swift
//  introViewCode
//
//  Created by Felipe Domingos on 26/11/22.
//

import UIKit
import MapKit
import AVFoundation
import AVKit

class DetailsCarView: UIView {
    
    var player: AVPlayer?
    var avpController = AVPlayerViewController()
    var urlVideo: String?
    var titleName: String?
    
    lazy var titleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.frame.size.height = 100
        view.frame.size.width = 414
        return view
    }()

    
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

    lazy var viewPlayer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        view.frame.size.height = 252
        view.frame.size.width = 374
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configSubViews()
        self.setUpConstraints()
        
    }
    
    private func configSubViews() {
        self.addSubview(self.titleView)
        self.addSubview(self.carsDetailsImageView)
        self.addSubview(self.idDetailsLabel)
        self.addSubview(self.typeDetailsLabel)
        self.addSubview(self.descDetailsLabel)
        self.addSubview(self.mapLocation)
        self.addSubview(self.viewPlayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func addDataDetails(data: CarModel) {
        self.urlVideo = data.urlVideo
        self.carsDetailsImageView.downloaded(from: data.urlFoto ?? "")
        self.titleName = data.nome
        self.descDetailsLabel.text = data.descricao
        self.typeDetailsLabel.text = data.tipo
        self.idDetailsLabel.text = "\(data.id ?? 0)" 
    }
    
    func playVideo() {
        guard let videoURL = URL(string: urlVideo ?? "") else { return}
        player = AVPlayer(url: videoURL)
        avpController.player = player
        avpController.view.frame.size.height = viewPlayer.frame.size.height
        avpController.view.frame.size.width = viewPlayer.frame.size.width
        self.viewPlayer.addSubview(avpController.view)
    }
    
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            self.titleView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            self.titleView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.titleView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            self.carsDetailsImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            self.carsDetailsImageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.carsDetailsImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -200),
            self.carsDetailsImageView.heightAnchor.constraint(equalToConstant: 150),
            
            self.idDetailsLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 55),
            self.idDetailsLabel.leadingAnchor.constraint(equalTo: self.carsDetailsImageView.trailingAnchor, constant: 10),
            self.idDetailsLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            self.typeDetailsLabel.topAnchor.constraint(equalTo: self.carsDetailsImageView.bottomAnchor, constant: 20),
            self.typeDetailsLabel.leadingAnchor.constraint(equalTo: self.carsDetailsImageView.trailingAnchor, constant: 10),
            self.typeDetailsLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            self.descDetailsLabel.topAnchor.constraint(equalTo: self.carsDetailsImageView.bottomAnchor, constant: 20),
            self.descDetailsLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.viewPlayer.topAnchor.constraint(equalTo: self.descDetailsLabel.bottomAnchor, constant: 20),
            self.viewPlayer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.viewPlayer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.viewPlayer.heightAnchor.constraint(equalToConstant: 252),
        ])
    }
}
