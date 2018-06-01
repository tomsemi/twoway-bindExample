//
//  ViewController.swift
//  twoway-bindExample
//
//  Created by Ge on 29/03/2018.
//  Copyright © 2018 Ge. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var uiSwitch: UISwitch!
    
    var isOn = Variable<Bool>(true)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testTwoWayBinding()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let disposeBag = DisposeBag()
    
    func randomCGFloat() -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(UINT32_MAX))
    }
    
    func testTwoWayBinding() {
        
        let value = ControlProperty(
            values: uiSwitch.rx.value.map { v in
                print("v is \(v)")
//                self.isOn.value = false
                return v//(self.randomCGFloat() > 0.5) ? v : !v
            },
            valueSink: uiSwitch.rx.value)
        
//        let value1 = ControlProperty(values: uiSwitch.rx.value, valueSink: uiSwitch.rx.value)
//
//        (value1 <-> isOn).disposed(by: disposeBag)
        
        (value <-> isOn).disposed(by: disposeBag)
        
        isOn.value = true

        _ = isOn.asObservable().subscribe(onNext: { (res) in
            print("res is \(res)")
            
        }, onError: { (error) in
            
        }, onCompleted: {
            
        }) {

        }
        
    }
    

}

