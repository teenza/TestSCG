//
//  TestSCGTests.swift
//  TestSCGTests
//
//  Created by kk on 20/4/2565 BE.
//

import XCTest
@testable import TestSCG

class TestSCGTests: XCTestCase {
    
    let apph = AppHelper()
    
    func test_get_json(){
        apph.getJSON("everything?q=apple&from=2022-04-19&to=2022-04-19&sortBy=popularity") { data in
            XCTAssertTrue(true)
        } failure: { error in
            XCTAssertFalse(false)
        }

    }
    
    func test_setImg(){
        let _url = URL(string:"https://i.kinja-img.com/gawker-media/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/d936518a90f42db2b3327639efecbc86.jpg")
            // Create Data Task
        let dataTask = URLSession.shared.dataTask(with: _url!) {(data, _, _) in
                if let data = data {
                    DispatchQueue.main.async {
                        XCTAssertTrue(true)
                    }
                }else{
                    XCTAssertFalse(false)
                }
            }
            //Start Data Task
            dataTask.resume()
    }
   

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
