//
//  ViewController.swift
//  Test
//
//  Created by lanlan on 2021/3/30.
//



import UIKit
import Lottie
 class ViewController: UIViewController {

    private var playAnimation = SDPlayAnimationView.playAnimationView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .orange
        
        let cusLable = UILabel()
        cusLable.text = "自定义实现的播放小动画"
        cusLable.textColor = UIColor.white
        view.addSubview(cusLable)
        cusLable.frame = CGRect(x: self.view.frame.size.width / 2 - 200 / 2, y: 100, width: 200, height: 25)
        
        
        playAnimation.backgroundColor = UIColor.red
        playAnimation.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        playAnimation.center =  CGPoint(x: cusLable.center.x, y: 200)
        self.view.addSubview(playAnimation)
        playAnimation.startAnimation()
        
        
        
        let lottieLable = UILabel()
        lottieLable.text = "使用Lottie播放小动画"
        lottieLable.textColor = UIColor.white
        view.addSubview(lottieLable)
        lottieLable.frame = CGRect(x: self.view.frame.size.width / 2 - 200 / 2, y: self.view.center.y - 100, width: 200, height: 25)
        
        
        let path = Bundle.main.path(forResource: "livingLottieAnimate", ofType: "json")!
        let imageView = AnimationView.init(filePath: path)
        imageView.backgroundColor = .cyan
        imageView.loopMode = .loop
        imageView.bounds = CGRect(x: 0, y: 0, width: 100, height: 100);
        imageView.center = self.view.center
        self.view.addSubview(imageView)
        imageView.play()
        
       
    }

}

