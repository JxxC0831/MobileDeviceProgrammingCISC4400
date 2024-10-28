import UIKit

var blogTitle = "Hello, Playground"
var blogBody = "Text for the article"
var blogAuthor = "Jiaxuan Cao"
var blogTitle2 = "Good bye yellow brick road"
var blogBody2 = "Text for the body 2"
var blogAuthor2 = "JX"

class blogPost {
    var title  = ""
    var body   = ""
    var author = ""
    var cost   = 0.00
}

let myBlog = blogPost()

//create object var() called my blog
myBlog.title = "Hello, playground"
myBlog.body  = "asoidjoasijdoainconxcnusdclkjncalksdjcbnlaksdcbnlasdhbcliqeiaudaioudo"
myBlog.author = "noname"
myBlog.cost = 100000000000000
print(myBlog.title)
print(myBlog.body)
print(myBlog.author)
print(myBlog.cost)

let mySecondBlog = blogPost()

mySecondBlog.title = "second article"
mySecondBlog.body = "seccccccccccccccccccccccccond"
mySecondBlog.author = "noname2"
mySecondBlog.cost = 100
print("----------------------------------------------------------------------------------------------------")
print(mySecondBlog.title)
print(mySecondBlog.body)
print(mySecondBlog.author)
print(mySecondBlog.cost)
