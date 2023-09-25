from pyswip import Prolog

prolog = Prolog()
prolog.consult("lab1.pl")

# Запрос пользовательского ввода
user_input = input("Введите строку в формате 'Игры разработанные компанией {название компании} для {название "
                   "платформы}': \n")

# Разбиваем введенную строку на части
parts = user_input.split()
if (len(parts) == 6 and parts[0] == 'Игры' and parts[1] == 'разработанные' and parts[2] == 'компанией'
        and parts[4] == 'для'):
    developer = parts[3]
    platform = parts[5]

    # Строим запрос на основе извлеченных значений
    query_str = f"games_by_developer_on_platform({developer}, {platform}, Games)."

    # Запрашиваем данные у Prolog
    res = next(prolog.query(query_str))["Games"]

    # Выводим ответ
    if len(res) == 0:
        print(f"Компанией {developer} не было разработано ни одной игры на платформе {platform}")
    else:
        print(" ".join(res))

# Обработка неправильной строки
else:
    print("Неверный формат ввода. Пожалуйста, используйте формат 'Игры разработанные компанией {название компании} "
          "для {название платформы}'")
