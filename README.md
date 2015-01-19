# Popo

A character based programmable text module for LÖVE. Simplifies text operations by providing a way for manipulating
how each character in a string behaves and is drawn.

## Usage

The [module]() file should be dropped on your project and required like so:

```lua
Text = require 'Text'
```

An object is returned and from that you can create multiple text objects.

## Table of Contents

* [Examples](#examples)
  * [Creating a text object](#creating-a-text-object)
  * [Fonts](#fonts)
  * [Functions](#functions)
  * [Multiple functions](#multiple-functions)
  * [Init functions](#init-functions)
  * [Passing values to functions](#passing-parameters-to-functions)
  * [Syntax](#syntax)
* [Text](#text)
* [Character](#character)

## Examples

## Creating a text object

Creates a text object and then updates and draws it:

```lua
function love.load()
  text = Text('Test text')
end

function love.update(dt)
  text:update(dt)
end

function love.draw()
  text:draw(10, 10)
end
```

## Fonts

When creating a text object, a table can be passed as the second argument (after the text string) to specify settings for this text. One of those settings allows to change the text's font:

```lua
text = Text('Popo popO, {
  font = love.graphics.newFont('DJB Almost Perfect.ttf', 72),
})
```
![popo popo 1](http://i.imgur.com/8viUw9k.png)

## Functions

You can also create functions that will change the text in some way:

```lua
text = Text('[Popo popO](randomColor)', {
  font = love.graphics.newFont('DJB Almost Perfect.ttf', 72),
  
  randomColor = function(dt, c)
    love.graphics.setColor(math.random(0, 255), math.random(0, 255), math.random(0, 255))
  end
})
```

And that should do this:

![popo popo 2](http://puu.sh/eIn3T/48ec75ce71.gif)

All functions defined in this way receive two arguments: `dt` and `c`. The first is just the normal `dt` you see in update functions, the second is the [character](#character) table, which contains general information about the current character. For instance, if we want to make the character move randomly based on how big its position is in the text string (meaning characters more to the right will move more):

```lua
text = Text('[Popo popO](move)', {
  font = love.graphics.newFont('DJB Almost Perfect.ttf', 72),
  
  move = function(dt, c)
    c.x = c.x + c.position*math.random(-1, 1)/5
    c.y = c.y + c.position*math.random(-1, 1)/5
  end
})
```

![popo popo 3](http://puu.sh/eInMV/32ca7d305a.gif)

## Multiple functions

Multiple functions can operate on a single piece of text and multiple pieces of text be created:

```lua
text = Text('[Popo](move) [popO](move; rotateScale)', {
  font = love.graphics.newFont('DJB Almost Perfect.ttf', 72),

  move = function(dt, c)
    c.x = c.x + c.position*math.random(-1, 1)/5
    c.y = c.y + c.position*math.random(-1, 1)/5
  end,

  rotateScale = function(dt, c)
    c.r = math.random(-1, 1)/10
    c.sx = math.random(10, 20)/10
    c.sy = math.random(10, 20)/10
  end
})
```

![popo popo 4](http://puu.sh/eIo1v/a46552b2ad.gif)

## Init functions

Functions act every update and the character table holds information about each character. If you want to set some state that can be updated or used on the update functions you'll need to use `Init` functions. They're just like normal functions except they have `Init` after their name. So, for instance:

```lua
text = Text('[Popo popO](shake)', {
  font = love.graphics.newFont('DJB Almost Perfect.ttf', 72),
  
  shakeInit = function(c)
    c.anchor_x = c.x
    c.anchor_y = c.y
  end,
  
  shake = function(dt, c)
    c.x = c.anchor_x + c.position*math.random(-1, 1)/2
    c.y = c.anchor_y + c.position*math.random(-1, 1)/2
  end
})
```

![popo popo 5](http://puu.sh/eIqh7/dec38f3150.gif)
