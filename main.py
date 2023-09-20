from pyswip import Prolog

prolog = Prolog()
prolog.consult("lab1.pl")
c = prolog.query("games_by_developer_on_platform(rockstar, pc, Games).")

game_names = []
for result in c:
    game_names.append(result["Games"])

print(game_names)