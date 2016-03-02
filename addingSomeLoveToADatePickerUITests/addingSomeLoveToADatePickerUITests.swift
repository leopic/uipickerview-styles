//
//  addingSomeLoveToADatePickerUITests.swift
//  addingSomeLoveToADatePickerUITests
//
//  Created by Leo Picado on 3/1/16.
//  Copyright © 2016 Leo Picado. All rights reserved.
//

import XCTest

class addingSomeLoveToADatePickerUITests: XCTestCase {
  
  var app:XCUIApplication!
  
  override func setUp() {
    super.setUp()
    continueAfterFailure = false
    app = XCUIApplication()
    app.launch()
  }
  
  // Broken test example
  func testExample() {
    let pickerWheel = app.pickerWheels.element
    
    // Reading the value
    if let value = pickerWheel.value as? String {
      XCTAssertNotEqual("1", value, "This is unexpected, using `viewForRow` affects the value.")
      XCTAssertEqual("1, 1 of 5", value, "This is the return value after using `viewForRow`.")
    }
    
    // Okay, I'll play ball and use this weird name instead
    pickerWheel.adjustToPickerWheelValue("3, 3 of 5")
    
    // Nope, still no dice
    pickerWheel.adjustToPickerWheelValue("3")
    
    // Okay I'll use recordings and get a hold of it like that
    app.pickerWheels["1, 1 of 5"].tap()
    
    XCTAssertNotNil(true)
    
  }
  
}
