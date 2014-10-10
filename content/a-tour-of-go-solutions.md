---
title: 'A Tour of Go' Exercise Solutions
category: web-dev
date: 2014-10-10
bodyclass: article
---

I'm trying to pick up the basics of the Go programming language. Here are my solutions for the exercises presented in 'A Tour of Go'. 

## [25. Exercise: Loops and Functions](http://tour.golang.org/#25)

    package main

    import (
        "fmt"
        "math"
    )

    func Sqrt(x float64) float64 {
        z, d := float64(1), float64(1)
        for d > 1e-15 {
            z0 := z
            z = z - (z * z - x)/(2 * z)
            d = math.Abs(z - z0)
        }
        return z
            
    }

    func main() {
        fmt.Println(Sqrt(2))
        fmt.Println(math.Sqrt(2))
    }
