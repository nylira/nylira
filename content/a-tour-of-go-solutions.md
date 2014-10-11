---
title: A Tour of Go - Exercise Solutions
category: web-dev
date: 2014-10-10
bodyclass: article
---

I'm trying to pick up the basics of the [Go](http://golang.org/) programming language. Here are my solutions for the exercises presented in '[A Tour of Go](http://tour.golang.org/)'. 

## Exercise: Loops and Functions [#25](http://tour.golang.org/#25)
 
The following code returns an approximation for the square root of 2 and compares the result to Go's `math.Sqrt()` function.

    package main

    import (
        "fmt"
        "math"
    )

    func Sqrt(x float64) float64 {

        // initialize variables
        z, d := float64(1), float64(1)

        // if delta is greater than 1e-15, seek closer approximation
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


## Exercise: Slices [#38](http://tour.golang.org/#38)

The following code creates an image with a repeating pattern.

    package main

    import "code.google.com/p/go-tour/pic"

    func Pic(dx, dy int) [][]uint8 {

        // initialize the image
        image := make([][]uint8, dy)

        // iterate over each pixel
        for x := 0; x < dy; x++ {
            image[x] = make([]uint8, dx)
            for y := 0; y < dx; y++ {

                // set a color value for each pixel
                image[x][y] = uint8((x ^y) * (x ^ y))

            }
        }
        return image
    }

    func main() {
        pic.Show(Pic)
    }


## Exercise: Maps [#43](http://tour.golang.org/#43)

The following code counts the number of instances of each word within a string.

    package main

    import (
        "code.google.com/p/go-tour/wc"
        "strings"
    )

    func WordCount(s string) map[string]int {
        
        // initialize the wordMap variable
        wordMap := make(map[string]int)
        
        // separate the strings into words
        words := strings.Fields(s)
        
        // iterate over the words to count each instance
        for _, word := range words {
            wordMap[word]++
        }
        
        return wordMap
    }

    func main() {
        wc.Test(WordCount)
    }

## Exercise: Fibonacci closure [#46](http://tour.golang.org/#46)

A simple Fibonacci sequence function. The Fibonacci sequence is the sequence of numbers where the `value(n) = value(n-1) + value (n-2)` with the seed values `value(0) = 0` and `value(1) = 1`.

    package main

    import "fmt"

    // fibonacci is a function that returns
    // a function that returns an int.
    func fibonacci() func() int {
        first, second := 0, 1
        return func() int {
            first, second = second, first + second
            return first
        }
    }

    func main() {
        f := fibonacci()
        for i := 0; i < 10; i++ {
            fmt.Println(f())
        }
    }

## Advanced Exercise: Complex cube roots [#50](http://tour.golang.org/#50)

The following function uses Newton's method for finding an approximation for cube roots and iterates over it 1000 times to get a rough value for a cube root of a number.

    package main

    import(
        "fmt"
        "math/cmplx"
    )

    func Cbrt(x complex128) complex128 {
        z := complex128(1)
        
        for i := 0; i < 1000; i++ {
            z = z - (cmplx.Pow(z, complex128(3)) - x)/(3 * cmplx.Pow(z, complex128(2)))
        }
        return z
        
    }

    func main() {
        fmt.Println(Cbrt(2))
    }

## Exercise: Errors [#58](http://tour.golang.org/#58)

Returning an error if the user tries to find the square root of a negative number.

    package main

    import (
        "fmt"
    )

    // error type
    type ErrNegativeSqrt float64

    // error function for the error type
    func (e ErrNegativeSqrt) Error() string {
        return fmt.Sprintf(
            "Can't find the Sqrt of a negative number: %v", float64(e))
    }

    func Sqrt(f float64) (float64, error) {
        
        // return error if number is negative
        if f < 0 {
            return 0, ErrNegativeSqrt(f)
            
        // otherwise find an approximation for the square root
        } else {
            z := float64(1)
            for i := 0; i < 1000; i++ {
                z = z - (z * z - f)/(2 * z)
            }
            return z, nil
        }
    }

    func main() {
        fmt.Println(Sqrt(2))
        fmt.Println(Sqrt(-2))
    }

## Exercise: HTTP Handlers [#60](http://tour.golang.org/#60)

    package main

    import (
        "net/http"
        "fmt"
    )

    type String string

    type Struct struct {
        Greeting string
        Punctuation string
        Who string
    }

    func (s String) ServeHTTP(
        w http.ResponseWriter,
        r *http.Request) {
        fmt.Fprint(w, s)
    }

    func (s Struct) ServeHTTP(
        w http.ResponseWriter,
        r *http.Request) {
        fmt.Fprint(w, s.Greeting, s.Punctuation, s.Who)
    }
        
    func main() {
      http.Handle("/string", String("I'm a frayed knot."))
      http.Handle("/struct", &Struct{"Hello", ":", "Gophers!"})
        http.ListenAndServe("localhost:4000", nil)
    }

## Exercise: Images [#62](http://tour.golang.org/#62)

This function defines and creates a test image.

    package main

    import (
        "code.google.com/p/go-tour/pic"
        "image"
        "image/color"
    )

    // create the custom image type
    type Image struct{
        width, height int
        pColor uint8
    }

    // set the image dimensions and location
    func (self *Image) Bounds() image.Rectangle {
      return image.Rect(0, 0, self.width, self.height)
    }
     
    // set the image color model
    func (self *Image) ColorModel() color.Model {
      return color.RGBAModel
    }
     
    // set the image color per pixel
    func (self *Image) At(x, y int) color.Color {
      return color.RGBA{
            self.pColor + uint8(x), self.pColor + uint8(y), 255, 255}
    }

    // create and show the image
    func main() {
        m := Image{100, 100, 128}
        pic.ShowImage(&m)
    }
