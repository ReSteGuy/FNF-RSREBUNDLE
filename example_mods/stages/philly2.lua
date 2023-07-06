function onCreate()
	-- background 
-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('sky','philly2/sky2', -100, 00);
		setLuaSpriteScrollFactor('sky', 0.1, 0.1);
		
		makeLuaSprite('city','philly2/city2', -10, 0);
		setLuaSpriteScrollFactor('city', 0.3, 0.3);
		scaleObject('city', 0.85, 0.85);
		makeLuaSprite('behindTrain','philly2/behindTrain2', -40, 50);
		makeLuaSprite('street','philly2/street2', -40, 50);



	end

	addLuaSprite('sky', false);
	addLuaSprite('city', false);
	addAnimationByPrefix('light', 'idle', 'light idle', 1, true);
	addLuaSprite('behindTrain', false);
	addLuaSprite('street', false);
	
end

function onEvent(eventName, value1, value2)
	if eventName == "ChangePhillyCustom" then
		-- CHECK 1
		if value1 == "1" then
			doTweenY("skytween", "sky", -1400, 3.0, "quadInOut")
		end
		if value1 == "2" then
			doTweenY("everytween", "city", 1600, 3.0, "quadInOut")
			doTweenY("everytween2", "behindTrain", 1600, 3.0, "quadInOut")
		end
	end
end
