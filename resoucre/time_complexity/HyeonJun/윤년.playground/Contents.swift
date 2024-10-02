import UIKit

import Foundation

let year = Int(readLine()!)!

if ((year % 4 == 0) && (year % 100 != 0)) || year % 400 == 0 {
    print(1)
} else {
    print(0)
}


// if 문 1회 시간복잡도 O(1)
