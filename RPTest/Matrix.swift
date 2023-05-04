//
//  Matrix.swift
//  RPTest
//
//  Created by ROMAN VRONSKY on 04.05.2023.
//

import Foundation

func nearestOnes(_ matrix: [[Int]]) -> [[Int]] {
    let rows = matrix.count
    let cols = matrix[0].count
    
    // Создаем матрицу с расстояниями, заполненную максимальными значениями
    var distances = Array(repeating: Array(repeating: Int.max, count: cols), count: rows)
    
    // Проходим по матрице слева направо, сверху вниз
    for i in 0..<rows {
        for j in 0..<cols {
            if matrix[i][j] == 1 {
                // Если текущая ячейка содержит 1, то расстояние до нее равно 0
                distances[i][j] = 0
            } else {
                // Иначе находим минимальное расстояние до ближайшей ячейки со значением 1
                if i > 0 {
                    distances[i][j] = min(distances[i][j], distances[i-1][j] + 1)
                }
                if j > 0 {
                    distances[i][j] = min(distances[i][j], distances[i][j-1] + 1)
                }
            }
        }
    }
    
    // Проходим по матрице справа налево, снизу вверх
    for i in (0..<rows).reversed() {
        for j in (0..<cols).reversed() {
            if i < rows-1 {
                distances[i][j] = min(distances[i][j], distances[i+1][j] + 1)
            }
            if j < cols-1 {
                distances[i][j] = min(distances[i][j], distances[i][j+1] + 1)
            }
        }
    }
    
    return distances
}

// Пример использования
let matrix = [[1,0,1],
              [0,1,0],
              [0,0,0]]
let result = nearestOnes(matrix) // [[0, 1, 0], [1, 0, 1], [2, 1, 2]]
 
/*Функция `nearestOnes` принимает матрицу и возвращает матрицу с расстояниями до ближайшей ячейки со значением 1. Алгоритм заключается в двух проходах по матрице: сначала слева направо, сверху вниз, затем справа налево, снизу вверх. На каждом проходе мы находим минимальное расстояние до ближайшей ячейки со значением 1, используя значения из предыдущих ячеек.
*/
