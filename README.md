# DIKit

Dependency Injection Framework for Swift, inspired by [KOIN](https://insert-koin.io/).

Basically an implementation of a service-locator pattern, living in the application context.

## Basic usage

1. Define a sub `DependencyContainer` (basically some sort of module declaration):
```swift
import DIKit

public extension DependencyContainer {
    static var backend: DependencyContainer {
        return DependencyContainer { container in
            container.register(as: .prototype) { Backend() as BackendProtocol }
        }
    }
}

public extension DependencyContainer {
    static var network: DependencyContainer {
        return DependencyContainer { container in
            container.register { Network() as NetworkProtocol }
        }
    }
}
```

2. Let `AppDelegate` adhere `DefinesContainer`:
```swift
import DIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, DefinesContainer {
    let container = DependencyContainer.derive(from: .backend, .network)
}
```

3. Inject the dependencies, for instance in a module:
```swift
import DIKit

class Backend: BackendProtocol {
    let network: NetworkProtocol = inject()
}
```

or a `ViewController`:
```swift
import DIKit

class FirstViewController: UIViewController {
    // MARK: - Dependencies
    let backend: BackendProtocol = inject()

    // MARK: - View lifecycle
    override func viewWillAppear(_ animated: Bool) {
        let result = backend.fetch()
        print(result)
    }
}
```
