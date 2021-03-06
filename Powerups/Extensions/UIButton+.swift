//
// Created by Andrew Grosner on 2018-09-13.
// Copyright (c) 2018 Fuzz. All rights reserved.
//

import Foundation
import UIKit


extension UIButton {
    
    var title: String? {
        get { return titleLabel?.text }
        set(t) { setTitle(t, for: .normal)}
    }
    
    @objc private func doTouchUp() { touchUp() }
    var touchUp: Closure {
        get { return associated(closure: "touchUp") }
        set(a) {
            associatedObjects["touchUp"] = a
            addTarget(self, action: #selector(doTouchUp), for: .touchUpInside)
        }
    }
    
    @objc private func doTouchDown() { touchDown() }
    var touchDown: Closure {
        get { return associated(closure: "touchDown") }
        set(a) {
            associatedObjects["touchDown"] = a
            addTarget(self, action: #selector(doTouchDown), for: .touchUpInside)
        }
    }
    

    func setBackgroundColor(_ color: UIColor) {
        let image = UIImage(color: color, size: CGSize(width: 1, height: 1))
        setBackgroundImage(image, for: .normal)
    }

    func solidBlueButton() {
        setBackgroundImage(nil, for: .normal)
        backgroundColor = .blinkWave
        layer.cornerRadius = 5.0
        layer.borderColor = .none
        layer.borderWidth = 0.0
        setTitleColor(.white, for: .normal)
        setTitleColor(.inputGray, for: .disabled)
        titleLabel?.font = .mediumBoldLight
    }

    func outlineButton() {
        backgroundColor = .clear
        let image = UIImage(color: .blackHaze, size: CGSize(width: 1, height: 1))
        setBackgroundImage(image, for: .normal)
        layer.borderWidth = 3.0
        layer.cornerRadius = 5.0
        clipsToBounds = true
        layer.borderColor = UIColor.blinkWave.cgColor
        setTitleColor(.blinkWave, for: .normal)
        setTitleColor(.inputGray, for: .disabled)
        titleLabel?.font = .mediumBoldBlue
    }

    // New button
    func solidBlueButton2() {
        setBackgroundImage(nil, for: .normal)
        backgroundColor = .wave
        layer.cornerRadius = 25.0
        layer.borderColor = .none
        layer.borderWidth = 0.0
        setTitleColor(.white, for: .normal)
        setTitleColor(.inputGray, for: .disabled)
        titleLabel?.font = .buttonWhite
    }

    // New button
    func whiteOutlineButton() {
        backgroundColor = .clear
        layer.borderWidth = 1.0
        layer.cornerRadius = 25.0
        clipsToBounds = true
        layer.borderColor = UIColor.white.cgColor
        setTitleColor(.white, for: .normal)
        setTitleColor(.white, for: .disabled)
        titleLabel?.font = .buttonBlue
    }

    // New button
    func blueOutlineButton() {
        backgroundColor = .clear
        layer.borderWidth = 1.0
        layer.cornerRadius = 25.0
        clipsToBounds = true
        layer.borderColor = UIColor.wave.cgColor
        setTitleColor(UIColor.wave, for: .normal)
        setTitleColor(UIColor.wave, for: .disabled)
        titleLabel?.font = .buttonBlue
    }

    func transparentButton() {
        backgroundColor = .clear
        layer.borderColor = .none
        layer.borderWidth = 0.0
        layer.cornerRadius = 0.0
        clipsToBounds = true
        setTitleColor(.wave, for: .normal)
        setTitleColor(.textDarkGray, for: .disabled)
        titleLabel?.font = .buttonBlue
    }

    func roundButton(radius: CGFloat, image: UIImage) {
        backgroundColor = .wave
        cornerRadius = radius
        setImage(image, for: .normal)
    }
}
