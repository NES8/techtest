import Foundation

@objc protocol PresenterInterface {
    @objc optional func viewDidLoad()
    @objc optional func viewWillAppear()
    @objc optional func viewDidAppear()
    @objc optional func viewWillDisappear()
    @objc optional func retry()
}

class BasePresenter: PresenterInterface {}
