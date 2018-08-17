//
//  FirstViewController.swift
//  DIKitExample
//
//  Created by Ben John on 12.01.18.
//  Copyright © 2018 Ben John. All rights reserved.
//

import UIKit
import DIKit

<<<<<<< HEAD
class FirstViewController: UIViewController {
    let backend: BackendProtocol = inject()

=======
class FirstViewController: UIViewController, HasDependencies {
    // MARK: - DIKit
    struct Dependency {
        let backend: BackendProtocol
        let localStorage: LocalStorageProtocol
    }
    var dependency: Dependency!
    
>>>>>>> feature/codegen
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        Dependency.inject(into: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
<<<<<<< HEAD
        let result = backend.fetch()
        print(result)
=======
        print(self.dependency.backend.fetch())
>>>>>>> feature/codegen
    }
}
