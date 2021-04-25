### 废话不说先上图

![QQ20210425-101606-HD.gif](https://upload-images.jianshu.io/upload_images/1510469-f661250eff521fcf.gif?imageMogr2/auto-orient/strip)

###有人开始说了 ,你这等于脱裤子放屁,那我引入大佬的一句话,存在即为合理,下面是GitHub Lottie提出的issues
![4DA653747AE599E5EFFAAF2F00120FFB.jpg](https://upload-images.jianshu.io/upload_images/1510469-f4077ba3747fec37.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)  
### CPU占用过高,这不能忍啊,我是这个小动画是一个按钮上的,当直播状态为直播中时间展示,就仅仅一个这么小的动画 CPU占用在30%左右,官方作者也提出了对应的性能问题
![A9A8DBCCA1B856E99485774B2B04F21C.jpg](https://upload-images.jianshu.io/upload_images/1510469-b4cbc1c49d6ff52c.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
###英语不好的我,直接翻译
![E9A5CC87-AE8C-4824-A8D0-6AF8BDCEF5B6.png](https://upload-images.jianshu.io/upload_images/1510469-565a6dc9d4e460db.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
### 大致的意思就是swift的锅,这种高深问题,不是我能搞定的,于是想着用原生写,看着也挺简单,实现起来也是有点波折的,我还恶补了layer有关的东西
### 废话不说上代码
```
import UIKit

class SDPlayAnimationView: UIView {
    /// 是否添加了动画
   private var isPlayAnimation:Bool   {
        get{
           let animation = lineOneLayer.animation(forKey: "animation1")
            guard let _ = animation  else {
                return false
            }
            return true
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutSubUI()
    }
    
    deinit {
        stopAnimation()
    }
    
    private func layoutSubUI() {
        
        let animationWidth = self.bounds.size.width
        
        let animationHeight = self.bounds.size.height
        
        let itemWidth = animationWidth / 3 * 0.45
        
        lineOneLayer.frame = CGRect(x: 0, y: animationHeight - 10, width: itemWidth, height: 10)
        
        lineTwoLayer.frame = CGRect(x: animationWidth / 2 -  itemWidth / 2, y: self.frame.size.height - 20, width: itemWidth, height: 20)
        
        lineThreeLayer.frame = CGRect(x: animationWidth -  itemWidth , y: self.frame.size.height - 15 , width: itemWidth, height: 15)
        self.layer.sublayers?.forEach({ (item) in
            item.cornerRadius = itemWidth * 0.5
        })
    }
    
    private lazy var lineOneLayer:CALayer = setupAnimationLayer()
    
    private lazy var lineTwoLayer:CALayer = setupAnimationLayer()
    
    private lazy var lineThreeLayer:CALayer = setupAnimationLayer()
}
 

extension SDPlayAnimationView: CAAnimationDelegate{
    
    
    /// 快速创建SDPlayAnimationView
    /// - Returns: SDPlayAnimationView
    public class func playAnimationView() -> SDPlayAnimationView {
        return SDPlayAnimationView()
    }
    
    
    /// 停止动画
    public  func stopAnimation() {
        self.layer.sublayers?.forEach({ (item) in
            item.removeAllAnimations()
        })
    }
    
    
    /// 开始动画
    public func startAnimation() {
        if isPlayAnimation {
            return
        }
        self.layoutIfNeeded()
        let height = self.bounds.size.height
        setupKeyframeAnimation(layer: lineOneLayer, values: [height * 0.2,height * 0.6,height,height * 0.6,height * 0.2],key: "animation1")
        setupKeyframeAnimation(layer: lineTwoLayer, values: [height * 0.6,height,height * 0.6,height * 0.2,height * 0.6],key: "animation2")
        self.setupKeyframeAnimation(layer: self.lineThreeLayer, values: [height,height * 0.6,height * 0.2,height * 0.6,height],key: "animation3")
    }
    

    private func setupAnimationLayer() -> CALayer {
        let layer = CALayer()
        layer.backgroundColor = UIColor.white.cgColor
        layer.anchorPoint = CGPoint(x: 0, y: 1)
        self.layer.addSublayer(layer)
        return layer
    }
    
     
    private func setupKeyframeAnimation(layer:CALayer,values:[Any] ,key:String)  {
        let animation = CAKeyframeAnimation(keyPath:"bounds.size.height")
        animation.values = values
        animation.duration = 1
        animation.repeatCount = MAXFLOAT
        animation.isRemovedOnCompletion = false
        layer.add(animation, forKey: key)
       
    }
}

```
### 再看下CPU,微丝不动,美滋滋
![69105AE878C6309D9783D86A69DCBE4F.jpg](https://upload-images.jianshu.io/upload_images/1510469-3c9193ef3dde489e.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
