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
  * [Passing parameters to functions](#passing-parameters-to-functions)
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
function love.load()
  local font = love.graphics.newFont('.ttf', 48)
  text = Text('Test text', {font = font})
end
```

## Functions
