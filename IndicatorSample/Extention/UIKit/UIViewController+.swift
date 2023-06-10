//
//  UIViewController+.swift
//  IndicatorSample
//
//  Created by 滝野翔平 on 2023/06/10.
//

import UIKit

extension UIViewController {
    
    func turnOnIndicator(type: IndicatorType) {
        displayIndicator(type: type)
    }
    
    func turnOffIndicator() {
        hideIndicator()
    }
}

// MARK: - Private

private extension UIViewController {
    
    func displayIndicator(type: IndicatorType) {
        // 一番下に無職透明のView(bcakgroundTransplantView)を配置する。
        // その上に、黒い半透明の背景View(viewBG)を配置する。
        // その上にインジケータを表示してその下にラベルを配置する。
        
        // 一番下の透明なViewのセッティング(タブバーとnavigationvarは触れてしまう。)
        let bcakgroundTransplantView = UIView()
        bcakgroundTransplantView.backgroundColor = .clear
        view.addSubview(bcakgroundTransplantView)
        
        //背景をViewControllerのViewのサイズに合わせる
        bcakgroundTransplantView.translatesAutoresizingMaskIntoConstraints = false
        bcakgroundTransplantView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bcakgroundTransplantView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bcakgroundTransplantView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bcakgroundTransplantView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bcakgroundTransplantView.tag = 99999
        
        //黒い半透明の背景
        #warning("widthとheight共に、スクリーンの比率で大きさ変更すべき")
        let viewBG = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        viewBG.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        viewBG.layer.cornerRadius = 20
        viewBG.translatesAutoresizingMaskIntoConstraints = true
        viewBG.center = view.center
        bcakgroundTransplantView.addSubview(viewBG)
        viewBG.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewBG.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        //インジケータの中身の処理
        #warning("widthとheight共に、スクリーンの比率で大きさ変更すべき")
        let indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        indicator.center = viewBG.center
        indicator.translatesAutoresizingMaskIntoConstraints = false
        viewBG.addSubview(indicator)
        
        //インジケーターを画面中央に配置
        indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: CGFloat(-5)).isActive = true
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        label.text = type.displayTitle
        indicator.style = .large
        indicator.color = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        viewBG.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: CGFloat(35)).isActive = true
        // tabbarがある画面で使用すると使用できてしまうので、インジケータ出てる時は、遷移できないようにする
        tabBarController?.tabBar.isUserInteractionEnabled = false
        indicator.startAnimating()
    }
    
    func hideIndicator() {
        // tabbarでも遷移できるようにする
        tabBarController?.tabBar.isUserInteractionEnabled = true
        //設定したtagを元に読み込み画面を削除
        if let view = view.viewWithTag(99999) {
            view.removeFromSuperview()
        }
    }
}
