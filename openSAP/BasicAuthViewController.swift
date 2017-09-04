//
// BasicAuthViewController.swift
// openSAP
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 04/09/17
//

import SAPFiori
import SAPFoundation
import SAPCommon

class BasicAuthViewController: UIViewController, SAPURLSessionDelegate, UITextFieldDelegate, Notifier, LoadingIndicator {

    private let logger = Logger.shared(named: "BasicAuthenticationLogger")

    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var loadingIndicator: FUILoadingIndicatorView?

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    var activeTextField: UITextField?

    @IBAction func loginButtonTapped(_ sender: AnyObject) {

        // Validate
        if (self.usernameTextField.text!.isEmpty || self.passwordTextField.text!.isEmpty) {
            displayAlert(title: NSLocalizedString("keyErrorLoginTitle", value: "Error", comment: "XTIT: Title of alert message about login failure."),
                message: NSLocalizedString("keyErrorLoginBody", value: "Username or Password is missing", comment: "XMSG: Body of alert message about login failure."))
            return
        }

        let sapUrlSession = SAPURLSession(delegate: self)

        sapUrlSession.register(SAPcpmsObserver(settingsParameters: Constants.configurationParameters))
        var request = URLRequest(url: Constants.appUrl)
        request.httpMethod = "GET"

        self.showIndicator()
        self.loginButton.isEnabled = false
        let dataTask = sapUrlSession.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                self.loginButton.isEnabled = true
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                let message: String
                if let error = error {
                    message = error.localizedDescription
                } else {
                    // default error mesage if no error happened
                    message = NSLocalizedString("keyErrorLogonProcessFailedNoResponseBody", value: "Check your credentials!", comment: "XMSG: Body of alert message about logon process failure.")
                }

                self.hideIndicator()
                self.displayAlert(title: NSLocalizedString("keyErrorLogonProcessFailedNoResponseTitle", value: "Logon process failed!", comment: "XTIT: Title of alert message about logon process failure."),
                    message: message)
                return
            }

            self.logger.info("Response returned: \(HTTPURLResponse.localizedString(forStatusCode: response.statusCode))")

            // We should check if we got SAML challenge from the server or not
            if !self.isSAMLChallenge(response) {

                // Save httpClient for further usage
                self.appDelegate.urlSession = sapUrlSession

                self.logger.info("Logged in successfully.")

                // Subscribe for remote notification
                self.appDelegate.registerForRemoteNotification()

                DispatchQueue.main.async {
                    // Update the UI
                    self.hideIndicator()
                    self.dismiss(animated: true)
                }
            } else {
                self.logger.info("Logon process failure. It seems you got SAML authentication challenge.")
                self.hideIndicator()
                self.displayAlert(title: NSLocalizedString("keyErrorLogonProcessFailedSAMLChallengeTitle", value: "Logon process failed!", comment: "XTIT: Title of alert message about logon process failure."),
                    message: "(HTTP \(String(response.statusCode)) - \(HTTPURLResponse.localizedString(forStatusCode: response.statusCode))")
            }
        }

        dataTask.resume()
    }

    private func isSAMLChallenge(_ response: HTTPURLResponse) -> Bool {
        return response.statusCode == 200 && ((response.allHeaderFields["com.sap.cloud.security.login"]) != nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        // Notification for keyboard show/hide
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func viewDidLoad() {
        self.usernameTextField.delegate = self
        self.passwordTextField.delegate = self
    }

    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    // Shrink Table if keyboard show notification comes
    func keyboardWillShow(notification: NSNotification) {
        self.scrollView.isScrollEnabled = true
        if let info = notification.userInfo, let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size {
            // Need to calculate keyboard exact size due to Apple suggestions
            let contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0)

            self.scrollView.contentInset = contentInsets
            self.scrollView.scrollIndicatorInsets = contentInsets

            var aRect = self.view.frame
            aRect.size.height -= keyboardSize.height
            if let activeField = self.activeTextField, (!self.view.frame.contains(activeField.frame.origin)) {
                let scrollPoint = CGPoint(x: 0, y: activeField.frame.origin.y - keyboardSize.height)
                self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
                self.scrollView.setContentOffset(scrollPoint, animated: true)
            }
        }
    }

    // Resize Table if keyboard hide notification comes
    func keyboardWillHide(notification: NSNotification) {
        // Once keyboard disappears, restore original positions
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        self.scrollView.isScrollEnabled = false
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.activeTextField?.resignFirstResponder()
        return true
    }

    func sapURLSession(_ session: SAPURLSession, task: SAPURLSessionTask, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping(SAPURLSession.AuthChallengeDisposition) -> Void) {
        if challenge.previousFailureCount > 0 {
            completionHandler(.performDefaultHandling)
            return
        }

        let credential = URLCredential(user: self.usernameTextField.text!, password: self.passwordTextField.text!, persistence: .forSession)
        completionHandler(.use(credential))
    }
}
