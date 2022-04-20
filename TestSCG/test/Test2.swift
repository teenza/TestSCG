//
//  Test2.swift
//  TestSCG
//
//  Created by kk on 20/4/2565 BE.
//

import Foundation

class Test2{
    
    var text:[String] = ["aka","Level","hello","kak","1234","222"]
    
    func run(){
        for t in text{
            self.conv(t)
        }
    }
    
    func conv(_ txt:String){
        
        let text = txt;
        let text_check = text.lowercased()
        var pdtext = ""
        let _txt = String(text_check)
        
        for i in _txt.reversed(){
            pdtext = "\(pdtext)\(i)"
        }
        
        if(text_check == pdtext ){
            print("\(text) is a palindrome")
        }else{
            print("\(text) isn’t a palindrome")
        }
    }
}
