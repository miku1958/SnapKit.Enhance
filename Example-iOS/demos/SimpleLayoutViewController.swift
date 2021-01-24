//
//  SimpleLayoutViewController.swift
//  SnapKit
//
//  Created by Spiros Gerokostas on 01/03/16.
//  Copyright © 2016 SnapKit Team. All rights reserved.
//

import UIKit

class SimpleLayoutViewController: UIViewController {

    var didSetupConstraints = false

    let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()

    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()

    let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        view.addSubview(blackView)
        view.addSubview(redView)
        view.addSubview(yellowView)
        view.addSubview(blueView)
        view.addSubview(greenView)

        view.setNeedsUpdateConstraints()
		
		DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
			self.blueView.snp.updateConstraints { make in
				make.bottom.equalTo(self.blackView.snp.top).offset(40.0)
			}
			self.blackView.snp.updateConstraints { make in
				make.height.equalTo(self.blueView.snp.width).multipliedBy(2)
			}
			UIView.animate(withDuration: 2) {
				self.view.layoutIfNeeded()
			}
		}
    }

    override func updateViewConstraints() {

        if (!didSetupConstraints) {

            blackView.snp.makeConstraints { make in
                make.center.equalTo(view)
                make.width.equalTo(100)
				make.height.equalTo(blueView.snp.width).multipliedBy(1)
            }

            redView.snp.makeConstraints { make in
                make.top.equalTo(blackView.snp.bottom).offset(20.0)
                make.right.equalTo(blackView.snp.left).offset(-20.0)
                make.size.equalTo(CGSize(width: 100, height: 100))
            }

            yellowView.snp.makeConstraints { make in
                make.top.equalTo(blackView.snp.bottom).offset(20.0)
                make.left.equalTo(blackView.snp.right).offset(20.0)
                make.size.equalTo(CGSize(width: 100, height: 100))
            }

            blueView.snp.makeConstraints { make in
                make.bottom.equalTo(blackView.snp.top).offset(-20.0)
                make.left.equalTo(blackView.snp.right).offset(20.0)
                make.size.equalTo(CGSize(width: 100, height: 100))
            }

            greenView.snp.makeConstraints { make in
                make.bottom.equalTo(blackView.snp.top).offset(-20.0)
                make.right.equalTo(blackView.snp.left).offset(-20.0)
                make.size.equalTo(CGSize(width: 100, height: 100))
            }

            didSetupConstraints = true
        }

        super.updateViewConstraints()
    }
}
