function onCreatePost()
	setProperty('iconP2.antialiasing', false)
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'texture', '3d')
			setPropertyFromGroup('unspawnNotes', i, 'antialiasing', false)
		end
	end
end

function onUpdate(elapsed)
        if curBeat >= 1 then
	started = true
	songPos = getSongPosition()
	local currentBeat = (songPos/5000)*(curBpm/60)
	doTweenY('opponentmove', 'dad', 150 - 150*math.sin((currentBeat+12*12)*math.pi), 2)
        end
	health = getProperty('health')
	if dadName == 'shaggy-3d' or dadName == 'shaggy-3d-intro' and health >= 0 then
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', '3d')
			setPropertyFromGroup('opponentStrums', i, 'antialiasing', false)
		end
	else
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets')
			setPropertyFromGroup('opponentStrums', i, 'antialiasing', true)
		end
	end
end