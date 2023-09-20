game(doom).
game(overwatch).
game(battlebit).
game(minecraft).
game(settlers).
game(dead_cells).
game(risk_of_rain).
game(death_stranding).
game(metal_gear).
game(uncharted).
game(dark_souls).
game(the_witcher).
game(gta).
game(red_dead_redemption).

player(stepan).
player(sasha).
player(katya).
player(andrey).
player(ivan).

player_platform(stepan, pc).
player_platform(sasha, mobile).
player_platform(katya, playstation).
player_platform(andrey, pc).
player_platform(ivan, xbox).

genre(doom, shooter).
genre(overwatch, shooter).
genre(battlebit, shooter).
genre(minecraft, sandbox).
genre(settlers, strategy).
genre(dead_cells, roguelike).
genre(risk_of_rain, roguelike).
genre(death_stranding, action_adventure).
genre(metal_gear, action_adventure).
genre(uncharted, action_adventure).
genre(dark_souls, action_rpg).
genre(the_witcher, action_rpg).
genre(gta, action_adventure).
genre(red_dead_redemption, action_adventure).

developer(doom, id_software).
developer(overwatch, blizzard_entertainment).
developer(battlebit, battlebit_studios).
developer(minecraft, mojang_studios).
developer(settlers, blue_byte).
developer(dead_cells, motion_twin).
developer(risk_of_rain, hopoo_games).
developer(death_stranding, kojima_productions).
developer(metal_gear, konami).
developer(uncharted, naughty_dog).
developer(dark_souls, fromsoftware).
developer(the_witcher, cd_projekt_red).
developer(gta, rockstar).
developer(red_dead_redemption, rockstar).

multiplayer(doom, true).
multiplayer(overwatch, true).
multiplayer(battlebit, true).
multiplayer(minecraft, true).
multiplayer(settlers, true).
multiplayer(dead_cells, false).
multiplayer(risk_of_rain, true).
multiplayer(death_stranding, false).
multiplayer(metal_gear, false).
multiplayer(uncharted, false).
multiplayer(dark_souls, true).
multiplayer(the_witcher, false).
multiplayer(gta, true).
multiplayer(red_dead_redemption, true).

platforms(doom, [pc, xbox, playstation]).
platforms(overwatch, [pc, xbox, playstation]).
platforms(battlebit, [pc]).
platforms(minecraft, [pc, xbox, playstation, switch, mobile]).
platforms(settlers, [pc]).
platforms(dead_cells, [pc, xbox, playstation, switch, mobile]).
platforms(risk_of_rain, [pc, xbox, playstation, switch]).
platforms(death_stranding, [pc, playstation]).
platforms(metal_gear, [pc, xbox, playstation]).
platforms(uncharted, [playstation]).
platforms(dark_souls, [pc, xbox, playstation, switch, mobile]).
platforms(the_witcher, [pc, xbox, playstation]).
platforms(gta, [pc, xbox, playstation]).
platforms(red_dead_redemption, [xbox, playstation, pc]).

release_year(doom, 1993).
release_year(overwatch, 2016).
release_year(battlebit, 2022).
release_year(minecraft, 2011).
release_year(settlers, 1993).
release_year(dead_cells, 2017).
release_year(risk_of_rain, 2013).
release_year(death_stranding, 2019).
release_year(metal_gear, 1987).
release_year(uncharted, 2007).
release_year(dark_souls, 2011).
release_year(the_witcher, 2007).
release_year(gta, 1997).
release_year(red_dead_redemption, 2010).

can_play_game(Player, Game) :-
    player_platform(Player, Platform),
    game(Game),
    platforms(Game, Platforms),
    member(Platform, Platforms).
    
games_by_developer_on_platform(Developer, Platform, Games) :-
    findall(Game, (
        game(Game),
        developer(Game, Developer),
        platforms(Game, Platforms),
        member(Platform, Platforms)
    ), Games).

games_released_after_year_on_platform(Year, Platform, Games) :-
    findall(Game, (
        game(Game),
        release_year(Game, GameYear),
        GameYear > Year,
        platforms(Game, Platforms),
        member(Platform, Platforms)
    ), Games).

has_games_of_genre_by_developer(Genre, Developer) :-
    game(Game),
    genre(Game, Genre),
    developer(Game, Developer).
    
can_play_together(Player1, Player2, Game) :-
    game(Game),
    player(Player1),
    player(Player2),
    player_platform(Player1, Platform1),
    player_platform(Player2, Platform2),
    platforms(Game, Platforms),
    member(Platform1, Platforms),
    member(Platform2, Platforms),
    multiplayer(Game, X),
    X = true.