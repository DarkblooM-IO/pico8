pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
--breakout
--by darkbloom

-- constants/globals

player_speed = 2

-- functions

function hitbox(x,y,w,h)
	return {x=x,y=y,w=w,h=h}
end

function overlap(a,b)
 return not (a.x>b.x+b.w
          or a.y>b.y+b.h
          or a.x+a.w<b.x
          or a.y+a.h<b.y)
end

function playercenter()
	return player.x+(player.w/2)
end

-- callbacks

function _init()
	player = hitbox(2,
	                123,
	                25,
	                2)
	-- funny var name below
	balls = {
		hitbox(playercenter(),
		       118,
		       5,
		       5)
	}
end

function _update()
	if (btn(⬅️) and player.x>0) player.x -= player_speed
	if (btn(➡️) and player.x+player.w<127) player.x += player_speed
end

function _draw()
	rectfill(0,0,127,127,1)
	rectfill(player.x,
	         player.y,
	         player.x+player.w,
	         player.y+player.h,
	         6)
	foreach(balls,function (ball)
		circfill(ball.x,
	 	        ball.y,
	  	       ball.w/2,
	    	     10)
	end)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
