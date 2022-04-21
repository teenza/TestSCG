//
//  Test1.swift
//  TestSCG
//
//  Created by kk on 20/4/2565 BE.
//

import Foundation

class Test1{

    var dataArray:[[Int]] = [
                                [3,5,6],
                                [1,3,5,7,9],
                                [3,6,8,1,5,10,1,7]
                            ]
    
    func run(){
        for t in dataArray{
            self.conv(t)
        }
    }
    
    func conv(_ array:[Int]){
        //หาผลรวมทางขวา เก็บลง array เพื่อเอาไปเปลี่ยบเทียบ
        let data1 = array
        var oi = 0
        let newArr = NSMutableDictionary()
        for (index, element) in data1.enumerated(){
            oi = (oi + element)
            newArr.setValue(index, forKey: "\(oi)")
           
        }
        //หาผลรวมทางซ้าย เก็บลง array
        oi = 0
        let newArr2 = NSMutableDictionary()
        for (index, element) in data1.enumerated().reversed(){
            oi = (oi + element)
            newArr2.setValue(index, forKey: "\(oi)")
           
        }
        //เปรียบเทียบผมรวมทั้ง 2 ข้าง
        var result_index = 0
        newArr.forEach({ (key: Any, value: Any) in
            let k = key as! String
            let v = value as! Int
            if((newArr2.object(forKey: k)) != nil){
                let v2 = newArr2.object(forKey: k) as! Int
                if(v2 > 0){
                    if(result_index < v){
                        result_index = v
                    }
                    
                }
            }
        })
        //แสดงผล
        if(result_index == 0){
            print("== \(data1) index not found")
        }else{
            print("== \(data1) middle index is \(result_index)")
        }
    }
}
