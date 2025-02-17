//
//  SettingsViewController.swift
//  Planets
//
//  Created by Andrew R Madsen on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var shouldShowPlutoSwitch: UISwitch!

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        setUpSubViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    // MARK: - Action Handlers
    
   @objc func changeShouldShowPluto(_ sender: UISwitch) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey)
    }
    
   @objc func done() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Private
    
    private func setUpSubViews(){
        //Set up the way the UI Looks
        let doneButton = UIButton(type: .system)
        doneButton.setTitle("Done", for: .normal)
        doneButton.addTarget(self, action: #selector(done), for: .touchUpInside)
        
        
        //Add as subview
        view.addSubview(doneButton)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        
        //Constrain
        let doneTopConstraint = NSLayoutConstraint(item: doneButton,
                                                   attribute: .top,
                                                   relatedBy: .equal,
                                                   toItem: view.safeAreaLayoutGuide,
                                                   attribute: .top,
                                                   multiplier: 1,
                                                   constant: 20)
        
        
        let doneButtonTrailing =  NSLayoutConstraint(item: doneButton,
                                                     attribute: .trailing,
                                                     relatedBy: .equal,
                                                     toItem: view.safeAreaLayoutGuide,
                                                     attribute: .trailing,
                                                     multiplier: 1,
                                                     constant: -20)
        
        NSLayoutConstraint.activate([doneTopConstraint,
                                            doneButtonTrailing])
        
        
        //Create UI
        let plutoSwitch = UISwitch()
        plutoSwitch.addTarget(self, action: #selector(changeShouldShowPluto), for: .valueChanged)
        
        //Constrain UI
        view.addSubview(plutoSwitch)
        plutoSwitch.translatesAutoresizingMaskIntoConstraints = false
        
        plutoSwitch.topAnchor.constraint(equalTo: doneButton.bottomAnchor, constant: 40).isActive = true
        plutoSwitch.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        //Set the view controllers property to the switch we just set up
        self.shouldShowPlutoSwitch = plutoSwitch
        
        let label = UILabel()
        label.text = "Is Pluto a Planet"
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.centerYAnchor.constraint(equalTo: plutoSwitch.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        label.trailingAnchor.constraint(equalTo: plutoSwitch.leadingAnchor, constant: -8).isActive = true
        
        
        
    }
    
    
    
    private func updateViews() {
        let userDefaults = UserDefaults.standard
        shouldShowPlutoSwitch.isOn = userDefaults.bool(forKey: .shouldShowPlutoKey)
    }
}
