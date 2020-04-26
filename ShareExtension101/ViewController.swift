//
//  ViewController.swift
//  ShareExtension101
//
//  Created by Oluwadamisi Pikuda on 24/04/2020.
//  Copyright © 2020 Damisi Pikuda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var urlTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNotification()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    func setupNotification() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(setUrl),
            name: UIApplication.didBecomeActiveNotification,
            object: nil
        )
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        self.setUrl()
    }

    @objc func setUrl() {
        if let incomingURL = UserDefaults(suiteName: "group.ShareExtension101")?.value(forKey: "incomingURL") as? String {
            urlTextField.text = incomingURL
            UserDefaults(suiteName: "group.ShareExtension101")?.removeObject(forKey: "incomingURL")
        }
    }
}

