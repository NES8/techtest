import UIKit

protocol BaseUI: AnyObject {
    func showInitialLoading()
    func showLoading()
    func removeLoading()
    func showMessageView(type: MessageViewType)
}

class BaseViewController: UIViewController, BaseUI {

    var lifecyclePresenter: PresenterInterface? {
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        lifecyclePresenter?.viewDidLoad?()
        view.backgroundColor = .systemBackground

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lifecyclePresenter?.viewWillAppear?()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        lifecyclePresenter?.viewWillDisappear?()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        lifecyclePresenter?.viewDidAppear?()
    }

    lazy var loadingView: LoadingView = {
        self.loadingView = UIView.loadFromNibNamed("LoadingView") as! LoadingView
        self.loadingView.frame = self.view.frame
        self.view.addSubview(self.loadingView)

        return self.loadingView
    }()

    lazy var errorConnectionView: MessageView = {
        self.errorConnectionView = MessageViewProvider.provide(
            type: MessageViewType.errorConnection,
            frame: self.view.frame
        )
        self.errorConnectionView.button.addTarget(self, action: #selector(retry), for: .touchUpInside)
        self.view.addSubview(self.errorConnectionView)
        return self.errorConnectionView
    }()

    var messageView: MessageView?

    @objc func retry() {
        lifecyclePresenter?.retry?()
    }

    // MARK: BaseUI

    func showInitialLoading() {
        hideAllSubviews(except: loadingView)
    }

    func showErrorConnection() {
        hideAllSubviews(except: errorConnectionView)
    }

    func showMessageView(type: MessageViewType) {
        if let messageView = messageView,
            let _ = messageView.superview {
            messageView.removeFromSuperview()
        }

        self.messageView = MessageViewProvider.provide(
            type: type,
            frame: self.view.bounds
        )
        self.view.addSubview(self.messageView!)
        hideAllSubviews(except: self.messageView)
    }

    func hideAllSubviews(except showView: UIView? = nil) {
        errorConnectionView.isHidden = showView != errorConnectionView
        loadingView.isHidden = showView != loadingView
        if let messageView = messageView {
            messageView.isHidden = showView != messageView
        }
    }

    // MARK: Spinner

    var vSpinner: UIView?

    func showLoading() {
        showSpinner(onView: self.view)
    }

    func removeLoading() {
        removeSpinner()
    }
}

private extension BaseViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        let activityIndicator = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
        activityIndicator.startAnimating()
        activityIndicator.center = spinnerView.center

        DispatchQueue.main.async {
            spinnerView.addSubview(activityIndicator)
            onView.addSubview(spinnerView)
        }

        vSpinner = spinnerView
    }

    func removeSpinner() {
        DispatchQueue.main.async {
            self.vSpinner?.removeFromSuperview()
            self.vSpinner = nil
        }
    }
}
