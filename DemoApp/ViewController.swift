//
//  ViewController.swift
//  DemoApp
//
//  Created by Adam Zemmoura on 30/03/2020.
//  Copyright © 2020 Adam Zemmoura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

}

// SwiftUI was announced at WWDC 2019 and offers a really nice declarative way to build UI but only works on devices running iOS 13^
// So sadly, for most it's not ready for production yet but we can still benefit from a great new feature of Xcode 11 -- Canvas & Previews
// If building UI in code, the only way to see the UI is to run it on the simulator or device but the build times can be really slow...
// Previews allow us to view the UI we're building instantaneously, side-by-side with the code, without any need to build or run.
//
// This code checks to see if SwiftUI framework is available (requires Xcode 11^ & macOS Catalina to develop & iOS 13^ to run on devices)
// If not, that's fine.  The code inside the if statement won't run on older versions of Xcode or if the deployment target is < iOS 13.
//
// For that reason , in Build Settings > iOS Deployment Target...
// Debug is set to 13^ (used for dev) & Release is 11.0 (the lowest iOS version your app currently supports)
#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct ViewControllerWrapper: UIViewControllerRepresentable {

    typealias UIViewControllerType = ViewController


    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerWrapper>) -> ViewControllerWrapper.UIViewControllerType {
        return ViewController()
    }

    func updateUIViewController(_ uiViewController: ViewControllerWrapper.UIViewControllerType, context: UIViewControllerRepresentableContext<ViewControllerWrapper>) {
        
    }

}

@available(iOS 13.0, *)
struct ViewController_Preview : PreviewProvider {
    static var previews: some View {
        ViewControllerWrapper().edgesIgnoringSafeArea(.all)
    }
}
#endif

