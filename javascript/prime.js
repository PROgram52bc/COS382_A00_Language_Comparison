function isPrime(n) {
  if (n <= 1) {
    return false
  }
  for (i = 2; i <= parseInt(Math.sqrt(n), 10); i++) {
    if (n % i == 0) {
      return false
    }
  }
  return true
}

function getPrimes(a, b) {
  primes = []
  for (k = a; k <= b; k++) {
    if (isPrime(k)) {
      primes.push(k)
    }
  }
  return primes
}

function primePartitions(n, k, lst) {
  if (n == 0) {
    console.log(lst.join(' + '))
  } else if (n > k) {
    primes = getPrimes(k+1, n)
    primes.forEach(prime => { primePartitions(n-prime, prime, lst.concat(prime))})
  }
}

const readline = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
});


console.log("Javascript Partitions Program")
input = readline.question('Enter a number (non-number to quit): ', name => {
  num = parseInt(name)
  primePartitions(num, 1, [])
  readline.close()
})
