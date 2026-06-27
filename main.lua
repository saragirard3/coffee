local constants = require "constants"
local Player = require "player"

local player

function love.load()
    --Assets and initialize variables here
    love.window.setTitle( "Coffee" )
    love.window.setMode( constants.WINDOW_W, constants.WINDOW_H, {resizable=true} )
    player = Player:new()
    
end

function love.update(dt)
    player:move(dt)
end

function love.draw()
    -- Draw your game here
    player:draw()
end