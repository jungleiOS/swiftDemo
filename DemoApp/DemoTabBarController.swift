//
//  DemoTabBarController.swift
//  DemoApp
//
//  Created by 蒋俊 on 2019/10/20.
//  Copyright © 2019 蒋俊. All rights reserved.
//

import UIKit

class DemoTabBarController: UITabBarController,UITabBarControllerDelegate {

    var demoHomeVC:DemoHomeVC!
    var demoClassifyVC:DemoClassifyVC!
    var demoShoppingCartVC:DemoShoppingCartVC!
    var demoOrderVC:DemoOrderVC!
    
    let shopNormalImage = UIImage.init(named: "商店")!
    let shopSelectedImage = UIImage.init(named: "商店 (1)")!
    
    let classifyNormalImage = UIImage.init(named: "物流")!
    let classifySelectedImage = UIImage.init(named: "物流 (1)")!
    
    let shoppingCartNormalImage = UIImage.init(named: "购物车")!
    let shoppingCartSelectedImage = UIImage.init(named: "购物车 (1)")!
    
    let orderNormalImage = UIImage.init(named: "下单")!
    let orderSelectedImage = UIImage.init(named: "下单 (1)")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self;
        self.navigationItem.title = "首页"
        
        let normalColor:UIColor = self.HexColor(hex: 0x707070, alpha: 1)
        let selectedColor:UIColor = self.HexColor(hex: 0xf0b10c, alpha: 1)
        
        self.demoHomeVC = DemoHomeVC.init()
        self.demoClassifyVC = DemoClassifyVC.init()
        self.demoShoppingCartVC = DemoShoppingCartVC.init()
        self.demoOrderVC = DemoOrderVC.init()
        
        self.setTabBarWithChildVC(childVC: self.demoHomeVC,
                                  tabBarTitle: "商店",
                                  tabBarNormalColor: normalColor,
                                  tabBarSelectedColor: selectedColor,
                                  tabBarNormalImage: shopNormalImage,
                                  tabBarSelectedImage: shopSelectedImage)
        
        self.setTabBarWithChildVC(childVC: self.demoClassifyVC,
                                  tabBarTitle: "物流",
                                  tabBarNormalColor: normalColor,
                                  tabBarSelectedColor: selectedColor,
                                  tabBarNormalImage: classifyNormalImage,
                                  tabBarSelectedImage: classifySelectedImage)
        
        self.setTabBarWithChildVC(childVC: self.demoShoppingCartVC,
                                  tabBarTitle: "购物车",
                                  tabBarNormalColor: normalColor,
                                  tabBarSelectedColor: selectedColor,
                                  tabBarNormalImage: shoppingCartNormalImage,
                                  tabBarSelectedImage: shoppingCartSelectedImage)
        
        self.setTabBarWithChildVC(childVC: self.demoOrderVC,
                                  tabBarTitle: "下单",
                                  tabBarNormalColor: normalColor,
                                  tabBarSelectedColor: selectedColor,
                                  tabBarNormalImage: orderNormalImage,
                                  tabBarSelectedImage: orderSelectedImage)
        
    }
    
    func HexColor(hex:integer_t, alpha:CGFloat) -> UIColor
    {
        return UIColor(red: CGFloat((hex >> 16) & 0xff)/255.0, green: CGFloat((hex >> 8) & 0xff)/255.0, blue: CGFloat(hex & 0xff)/255.0, alpha: alpha)
    }
    
    func setTabBarWithChildVC(childVC:UIViewController, tabBarTitle:String, tabBarNormalColor:UIColor, tabBarSelectedColor:UIColor, tabBarNormalImage:UIImage, tabBarSelectedImage:UIImage) -> Void {
        let attrs:Dictionary = [
            NSAttributedString.Key.foregroundColor:tabBarNormalColor,
        ]
        
        let selectedAttrs:Dictionary = [
            NSAttributedString.Key.foregroundColor:tabBarSelectedColor,
        ]
        childVC.tabBarItem.title = tabBarTitle
        childVC.tabBarItem.image = tabBarNormalImage.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        childVC.tabBarItem.selectedImage = tabBarSelectedImage.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        childVC.tabBarItem.setTitleTextAttributes(attrs, for: UIControl.State.normal)
        childVC.tabBarItem.setTitleTextAttributes(selectedAttrs, for: UIControl.State.selected)
        self.addChild(childVC)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if viewController.isEqual(self.demoHomeVC) {
            self.navigationItem.title = "首页"
        }
        else if viewController.isEqual(self.demoClassifyVC) {
            self.navigationItem.title = "分类"
        }
        else if viewController.isEqual(self.demoShoppingCartVC) {
            self.navigationItem.title = "购物车"
        }
        else if viewController.isEqual(self.demoOrderVC) {
            self.navigationItem.title = "订单"
        }
        
        return true;
        
    }
}
