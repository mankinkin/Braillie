//
//  EmitterView.swift
//  Braillie
//
//  Created by Kai Shing Ng on 9/4/2023.
//

import SwiftUI

struct EmitterView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let size = CGSize(width: 500, height: 500)
        let host = UIView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))

        let particlesLayer = CAEmitterLayer()
        particlesLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        //particlesLayer.backgroundColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor

        
        host.layer.addSublayer(particlesLayer)
        //host.layer.masksToBounds = true
        particlesLayer.emitterShape = .circle
        particlesLayer.emitterPosition = CGPoint(x: 82, y: 130)
        particlesLayer.emitterSize = CGSize(width: 500, height: 500)
        particlesLayer.emitterMode = .points
        particlesLayer.renderMode = .backToFront



        let image1 = UIImage(named: "tada")?.cgImage

        let cell1 = CAEmitterCell()
        cell1.contents = image1
        cell1.name = "Snow"
        cell1.birthRate = 10
        cell1.speed = 3
        cell1.alphaSpeed = -0.8;
        cell1.lifetime = 3.0
        cell1.velocity = 150
        cell1.velocityRange = -30.0
        cell1.xAcceleration = 0
        cell1.yAcceleration = -10
        cell1.emissionRange = 180.0 * (.pi / 180.0)
        cell1.spin = -28.6 * (.pi / 180.0)
        cell1.spinRange = 57.2 * (.pi / 180.0)
        cell1.scale = 0.06
        cell1.scaleRange = 0.6
        cell1.color = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor

        particlesLayer.emitterCells = [cell1]
        return host
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }

    typealias UIViewType = UIView
}

