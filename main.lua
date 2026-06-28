local constants = require "constants"
local Player = require "player"
local Coffee = require "coffee"

local player
local coffee

function love.load()
    --Assets and initialize variables here
    love.window.setTitle( "Coffee" )
    love.window.setMode( constants.WINDOW_W, constants.WINDOW_H, {resizable=true} )
    player = Player:new()
    coffee = Coffee:new()
    
end

function love.update(dt)
    player:update(dt)
end

function love.draw()
    -- Draw your game here
    player:draw()
    coffee:draw()
end