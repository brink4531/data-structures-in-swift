import UIKit

//MARK: - Quick Sort
public func quicksort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1 else { // 1
        return a
    }
    let pivot = a[a.count / 2] // 2
    let less = a.filter { $0 < pivot } // 3
    let equal = a.filter { $0 == pivot }
    let greater = a.filter { $0 > pivot }
    return quicksort(less) + equal + quicksort(greater) // 4
}

let arr = [12, 0, 3, 9, 2, 18, 8, 27, 1, 5, 8, -1, 21]

print(arr)
quicksort(arr)


//MARK: - Merge Sort
func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
  guard array.count > 1 else { return array }

  let middleIndex = array.count / 2
  
  let leftArray = mergeSort(Array(array[0..<middleIndex]))
  let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
  
  return merge(leftArray, rightArray)
}

func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
  var leftIndex = 0
  var rightIndex = 0

  var orderedArray: [T] = []
  
  while leftIndex < left.count && rightIndex < right.count {
    let leftElement = left[leftIndex]
    let rightElement = right[rightIndex]

    if leftElement < rightElement {
      orderedArray.append(leftElement)
      leftIndex += 1
    } else if leftElement > rightElement {
      orderedArray.append(rightElement)
      rightIndex += 1
    } else {
      orderedArray.append(leftElement)
      leftIndex += 1
      orderedArray.append(rightElement)
      rightIndex += 1
    }
  }

  while leftIndex < left.count {
    orderedArray.append(left[leftIndex])
    leftIndex += 1
  }

  while rightIndex < right.count {
    orderedArray.append(right[rightIndex])
    rightIndex += 1
  }
  
  return orderedArray
}
