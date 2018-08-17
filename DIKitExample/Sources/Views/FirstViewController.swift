//
//  FirstViewController.swift
//  DIKitExample
//
//  Created by Ben John on 12.01.18.
//  Copyright © 2018 Ben John. All rights reserved.
//

import UIKit
import DIKit

class FirstViewController: UIViewController, HasDependencies {
    // MARK: - Dependency declaration
    struct Dependency: HasContainerContext {
        let backend: BackendProtocol = container.resolve()
    }
    var dependency: Dependency! = Dependency()

    // MARK: - View lifecycle
    override func viewWillAppear(_ animated: Bool) {
        let result = dependency.backend.fetch()
        print(result)
    }
}
