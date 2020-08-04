//
//  NSViewController.swift
//  VIP-Clean-Architecture
//
//  Created by Ahil Ahilendran on 5/8/20.
//  Copyright © 2020 Ahil Ahilendran. All rights reserved.
//

import UIKit

public class NSViewController: UIViewController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override public func loadView() {
        super.loadView()
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        setup()
        if #available(iOS 13.0, *) {
            // Always adopt a light interface style.
            overrideUserInterfaceStyle = .light
        }
    }


    fileprivate func setup() {
        view.backgroundColor = .white
        setupUIInteraction()
        setupConstraints()
        setupLocalisation()
    }

    func setupViews() {
        //to be overriden in subClasses
    }

    func setupUIInteraction() {
        //to be overriden in subClasses
    }

    func setupConstraints() {
        //to be overriden in subClasses
    }

    func setupLocalisation() {
        //to be overriden in subClasses
    }


    override public var prefersStatusBarHidden: Bool {
        return false
    }

    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
