//
//  MBHubLoading.swift
//  MyMovieApp
//
//  Created by Victor De la Torre Anicama on 4/04/22.
//

import Foundation
import NVActivityIndicatorView

class MBHubLoading : NSObject {
    static func showLoading() -> Void {
        MBHubLoading .showLoading("")
    }
    
    static func showLoading(_ message: String) -> Void {
        let activityData = ActivityData(size: CGSize(width: 50.0, height: 50.0), message: message, messageFont: UIFont(name: "Regular", size: 13), messageSpacing: 10, type: .ballSpinFadeLoader, color: nil, padding: nil, displayTimeThreshold: nil, minimumDisplayTime: nil, backgroundColor: nil, textColor: nil)
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
    }
    
    static func hideLoading() -> Void {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
    }
    
    static func showLoading(inView: UIView?, tintColor: UIColor = .gray) -> Void {
        if let inView = inView {
            DispatchQueue.main.async {
                let hud = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
                hud.type = .ballSpinFadeLoader
                hud.color = tintColor
                hud.center = CGPoint(x: inView.frame.size.width/2.0, y: inView.frame.size.height/2.0)
                inView.addSubview(hud)
                inView.bringSubviewToFront(hud)
                hud.startAnimating()
            }
        }
    }
    
    static func hideLoading(inView : UIView?) -> Void {
        if let inView = inView {
            DispatchQueue.main.async {
                for view in inView.subviews {
                    if view.isKind(of: NVActivityIndicatorView.self) {
                        let hud = view as! NVActivityIndicatorView
                        hud.stopAnimating()
                    }
                }
            }
        }
    }
    
    
}

