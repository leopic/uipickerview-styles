//
//  ViewController.swift
//  addingSomeLoveToADatePicker
//
//  Created by Leo Picado on 3/1/16.
//  Copyright © 2016 Leo Picado. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

  let rowFontSize = CGFloat(30)
  let selectedRowFontSize = CGFloat(48)
  var rows = [Int]()
  
  @IBOutlet weak var pickerView: UIPickerView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Quick Jon-ism to populate the cells
    rows = (1...5).map({return $0})
    pickerView.delegate = self
    pickerView.dataSource = self
  }
  
  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return rows.count
  }
  
  func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
    let borderWidth = CGFloat(2.25)
    let borderColor:UIColor = .whiteColor()
    
    // Configuring the cell
    let view = view as? UILabel ?? UILabel()
    view.text = rows[row].description
    view.textAlignment = .Center
    
    // Styles for selected cells
    if pickerView.selectedRowInComponent(component) == row {
      view.textColor = .whiteColor()
      view.font = UIFont.boldSystemFontOfSize(selectedRowFontSize)
    } else {
      // Styles for non-selected cells
      view.textColor = .lightGrayColor()
      view.font = UIFont.systemFontOfSize(rowFontSize)
    }
    
    // Adding white borders around the selected view
    pickerView.subviews[1].frame = getBorderFrame(pickerView.subviews[1], borderWidth: borderWidth)
    pickerView.subviews[1].backgroundColor = borderColor
    pickerView.subviews[2].frame = getBorderFrame(pickerView.subviews[2], borderWidth: borderWidth)
    pickerView.subviews[2].backgroundColor = borderColor
    
    return view
  }
  
  // Refresh all rows when one is selected, this is just so the selected row gets the new styles
  func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    pickerView.reloadAllComponents()
  }
  
  // Height for all rows, based on the height of the selected row's font size
  func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
    let lineHeight = CGFloat(1.5)
    return selectedRowFontSize * lineHeight
  }
  
   /**
   Takes the top/bottom view of the selectedRow within a UIPickerView and
   returns a modified frame accounting for border
   
   - parameter view:        top/bottom view of a UIDatePicker
   - parameter borderWidth: width of the border that will be added
   
   - returns: Updated CGRect
   */
  private func getBorderFrame(view:UIView, borderWidth:CGFloat) -> CGRect {
    let origin = view.frame.origin
    let size = view.frame.size
    return CGRect(x: origin.x, y: origin.y, width: size.width, height: borderWidth)
  }


}

