Game for the [UNC Fall 2024 Game Jam](https://itch.io/jam/2024-collegiate-fall-game-jam)

Model:
Each "level" gives you a unique pit, X senators, Y seconds, and a quota of Z deaths
Each level is saved as its own numeric scene. (e.g. levelOne.tscn, levelTwo.tscn, etc.)
The unique hazard area of each level is stored in its own scene (e.g. levelOneHazardArea.tscn) and inherited by the level scene.
The generic pit is stored in pit.tscn and inherited by all levels.
Control elements like levelClock, senatorCount, and deathCount are each inherited by the level scene.
All levels, when they are displayed, are displayed within mainEnvironment.
Interruptions of gameplay (e.g. pause menus) are displayed in mainEnvironment.
Things outside of gameplay (e.g. cutscenes) exist in another scene entirely.

mainEnvironment > currentLevel > pit
								 currentLevelHazardArea
								 levelClock
								 senatorCounter
								 deathCounter
				  pause menus
				  text bubbles
