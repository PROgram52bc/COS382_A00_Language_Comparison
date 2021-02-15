package main

import (
  "fmt"
  "strconv"
  "math"
  "strings"
)

func isPrime(n int) bool {
  if n <= 1 {
    return false
  }
  for x:= 2; x <= int(math.Sqrt(float64(n))); x++ {
    if n % x == 0 {
      return false
    }
  }
  return true
}

func primePartitions(n, k int, lst []string) {
  if n == 0 {
    fmt.Println(strings.Join(lst[:], " + "))
  } else if n > k {
    for p := k+1; p <= n; p++ {
      if isPrime(p) {
        primePartitions(n-p, p, append(lst, strconv.Itoa(p)))
      }
    }
  }
}

func main() {
    fmt.Println("Go Prime Partitions Program!")
    fmt.Print("Enter a number: ")

    var input string
    fmt.Scanln(&input)
    n, _ := strconv.Atoi(input)
    primePartitions(n, 1, []string{})

}
