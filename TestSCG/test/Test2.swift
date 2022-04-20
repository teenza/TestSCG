//
//  Test2.swift
//  TestSCG
//
//  Created by kk on 20/4/2565 BE.
//

import Foundation

class Test2{
    
    var text:[String] = ["aka","Level","hello"]
    
    func run(){
        
    }
    
    func conv(_ txt:String){
        let _txt = txt.components(separatedBy: " ")
        for i in _txt{
            print(i)
        }
    }
}
