//
//  PlanetCollectionViewCell.swift
//  ProgrammaticPlanets
//
//  Created by Spencer Curtis on 9/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PlanetCollectionViewCell: UICollectionViewCell {
    
    private var imageView: UIImageView!
    private var nameLabel: UILabel!
    
    var planet: Planet! {
        didSet {
            updateViews()
        }
    }
    
    
    // You programatically initializing  this cell
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpSubViews()
    }
    
    
    private func setUpSubViews(){
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        self.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
                            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
                            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 2),
                            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -2),
                            //1:1 anchor making the height equal the width
                            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1)
            
            
                                    ])
        
                    self.imageView = imageView
        
        let label = UILabel()
        label.textAlignment = .center
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            NSLayoutConstraint(item: label,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: imageView,
                               attribute: .bottom,
                               multiplier: 1,
                               constant: 4),
            
            NSLayoutConstraint(item: label,
                               attribute: .leading,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .leading,
                               multiplier: 1,
                               constant: 2),
            
            NSLayoutConstraint(item: label,
                               attribute: .trailing,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .trailing,
                               multiplier: 1,
                               constant: -2)
            
            
            
        
        ])
        
        self.nameLabel = label
        
        
    }
    
    
    private func updateViews() {
        imageView.image = planet.image
        nameLabel.text = planet.name
    }
    
}
