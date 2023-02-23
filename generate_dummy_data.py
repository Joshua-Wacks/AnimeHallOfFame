from random import randint

anime_info = {
    1:{
        "anime_series_name":"Attack on Titan",
        "anime_series_description":"Set in a post-apocalyptic world where the remains of humanity live behind walls protecting them from giant humanoid Titans, Attack on Titan follows protagonist Eren Yeager, along with friends Mikasa Ackerman and Armin Arlert",
        "anime_series_ongoing":1,
        "anime_seasons":{
            1:["Eren Jaeger", "Mikasa Ackerman", "Erwin Smith", "Reiner Braun", "Armen Arlert"],
            2:["Eren Jaeger", "Mikasa Ackerman", "Levi Ackerman", "Sasha Braus", "Armen Arlert"],
            3:["Eren Jaeger", "Mikasa Ackerman", "Sasha Braus", "Connie Springer", "Armen Arlert"],
            4:["Eren Jaeger", "Mikasa Ackerman", "Levi Ackerman", "Reiner Braun", "Armen Arlert"],
        }
    },
    
    2:{
        "anime_series_name":"Naruto",
        "anime_series_description":"On the day of Naruto Uzamakis birth the village of Konoha was attacked by the 9-tailed fox demon. In order to protect the village Narutos father the 4th hokage sacrificed his life and sealed the demon in his new born son. 13 years later Naruto graduates the ninja academy and becomes a shinobi with goal to be the hokage of the village. Joining him are rival Sasuke Uchiha who attempts to gain power to avenge his clan after they were murdered by his older brother Itachi. And Sakura Haruno who is Narutos love interest who of course loves his rival Sasuke.",
        "anime_series_ongoing":0,
        "anime_seasons":{
            1:["Kakashi Hatake", "Naruto Uzumaki", "Might Guy", "Sasuke Uchiha", "Gaara"],
            2:["Kakashi Hatake", "Naruto Uzumaki", "Shikamaru Nara", "Rock Lee", "Gaara"]
        }
    },
    3:{
        "anime_series_name":"Hunter x Hunter",
        "anime_series_description":"he story focuses on a young boy named Gon Freecss who discovers that his father, who left him at a young age, is actually a world-renowned Hunter, a licensed professional who specializes in fantastical pursuits such as locating rare or unidentified animal species, treasure hunting, surveying unexplored enclaves, or hunting down lawless individuals. Gon departs on a journey to become a Hunter and eventually find his father. Along the way, Gon meets various other Hunters and encounters the paranormal.",
        "anime_series_ongoing":0,
        "anime_seasons":{
            1:["Gon Freecss", "Killua Zoldyck", "Hisoka Morow", "Kurapika", "Leorio Paladiknight"]
        }
    },
    4:{
        "anime_series_name":"Jujutsu Kaisen",
        "anime_series_description":"Yuji Itadori, a kind-hearted teenager, joins his schools Occult Club for fun, but discovers that its members are actual sorcerers who can manipulate the energy between beings for their own use. He hears about a cursed talisman - the finger of Sukuna, a demon - and its being targeted by other cursed beings. Yuji eats the finger to protect his friends, and ends up becoming Sukunas host. However, Yuji discovers that he has inherited magic and is able to control this power without interference from Sukuna. He joins the Tokyo Metropolitan Magic Technical College to consumes all of Sukunas fingers, which will enable a full exorcism to take place that will free him.",
        "anime_series_ongoing":1,
        "anime_seasons":{
            1:["Yuji Itadori", "Megumi Fushiguro", "Nobara Kugisaki", "Satoru Gojo"]
        }
    },
    5:{
        "anime_series_name":"Demon Slayer",
        "anime_series_description":"A family is attacked by demons and only two members survive - Tanjiro and his sister Nezuko, who is turning into a demon slowly. Tanjiro sets out to become a demon slayer to avenge his family and cure his sister.",
        "anime_series_ongoing":1,
        "anime_seasons":{
            1:["Tanjiro Kamado", "Nezuko Kamado", "Zenitsu Agatsuma", "Inosuke Hashibira"],
            2:["Tanjiro Kamado", "Nezuko Kamado", "Zenitsu Agatsuma", "Inosuke Hashibira"]
        }
    }
}

f = open("data_generator.sql", "w")
sql = ""
inserted_characters = []

for key in anime_info:
    anime = anime_info[key]
    sql += f"-------------------- anime: {anime['anime_series_name']} --------------------\n\n"
    sql += "INSERT INTO anime_series\n" \
        f"VALUES ('{anime['anime_series_name']}', '{anime['anime_series_description']}', {anime['anime_series_ongoing']})\n\n"
    
    for season in anime["anime_seasons"]:
        sql += f"-------------------- season: {season} --------------------\n\n"
        episodes = randint(12,24)
        duration = randint(20,24)
        rating = randint(0,10)
        startdate = randint(2000, 2023)
        sql += "INSERT INTO anime_season\n" \
            f"VALUES ({key}, {season}, {episodes}, {duration}, {rating}, {startdate})\n\n"
        
        for character in anime["anime_seasons"][season]:
            if character not in inserted_characters:
                inserted_characters.append(character)
                birthyear = randint(1900, 2100)
                sql += "INSERT INTO anime_character\n" \
                    f"VALUES ('{character}', {birthyear})\n\n"

            sql += "INSERT INTO character_in_season\n" \
                f"VALUES ({inserted_characters.index(character)+1}, {key}, {season})\n\n"

            impact = randint(0, 100)
            purpose_fulfilled = randint(0, 100)
            humour = randint(0, 100)
            hairstyle = randint(0, 100)
            lovelife = randint(0, 100)
            networth = randint(0, 100)

            sql += "INSERT INTO hof_attributes\n" \
                f"VALUES ({impact}, {purpose_fulfilled}, {humour}, {hairstyle}, {lovelife}, {networth}, 0)\n\n"

f.write(sql)
f.close()