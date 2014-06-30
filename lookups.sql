-- Races
INSERT INTO races (name, description)
  VALUES ('Ape', 'An advanced race of primates who make their home in the jungles of the western Lowlands. Their ranks consist of gorillas, orangutans, and baboons.');
INSERT INTO races (name, description)
  VALUES ('Champion', 'The world is watched over by the gods, and the champions whose destinies they ordain.');
INSERT INTO races (name, description)
  VALUES ('Darklander', 'Branded the betrayers of the Highlanders, this race still worships the old gods. They believe emotion must be embraced, not controlled.');
INSERT INTO races (name, description)
  VALUES ('Dwarf', 'A race that dwells deep beneath the western lands. They have mastered the arts of gas lighting and steam power, using these to forge their war machines.');
INSERT INTO races (name, description)
  VALUES ('Easterner', 'These people dwell in the vast feudal kingdoms of the east.');
INSERT INTO races (name, description)
  VALUES ('Goblin', 'A crude race that dwells deep beneath the eastern lands.');
INSERT INTO races (name, description)
  VALUES ('Highlander', 'A race more ancient, wise, and long-lived than the race of men. Highlanders are stoic, seeking to purify their minds through meditation and pilgrimage.');
INSERT INTO races (name, description)
  VALUES ('Lizardman', 'A broad term for the reptiles who dwell in the swamps of the eastern Lowlands. They have forged an empire from the crocodile, raptor, turtle, and chameleon realms.');
INSERT INTO races (name, description)
  VALUES ('Paragon', 'The world is filled with angels, and the paragons who do their bidding.');
INSERT INTO races (name, description)
  VALUES ('Undead', 'The living dead who have been reanimated in a blight scourging the world. Of late, it seems they are led by some greater power.');
INSERT INTO races (name, description)
  VALUES ('Unknown', '');
INSERT INTO races (name, description)
  VALUES ('Westerner', 'These people dwell in the vast feudal kingdoms of the west.');

-- Rarities
INSERT INTO rarities (name, rank, max_level)
  VALUES ('Warlord', 0, 170);
INSERT INTO rarities (name, rank, max_level)
  VALUES ('Common', 1, 30);
INSERT INTO rarities (name, rank, max_level)
  VALUES ('Uncommon', 2, 40);
INSERT INTO rarities (name, rank, max_level)
  VALUES ('Rare', 3, 70);
INSERT INTO rarities (name, rank, max_level)
  VALUES ('Epic', 4, 99);
INSERT INTO rarities (name, rank, max_level)
  VALUES ('Legendary', 5, 99);
INSERT INTO rarities (name, rank, max_level)
  VALUES ('Mythic', 6, 99);

-- Growths
INSERT INTO growths (name)
  VALUES ('Fast');
INSERT INTO growths (name)
  VALUES ('Normal');
INSERT INTO growths (name)
  VALUES ('Late Bloomer');
INSERT INTO growths (name)
  VALUES ('???');

-- Stats
INSERT INTO stats (name)
  VALUES ('HP');
INSERT INTO stats (name)
  VALUES ('ATK');
INSERT INTO stats (name)
  VALUES ('DEF');
INSERT INTO stats (name)
  VALUES ('WIS');
INSERT INTO stats (name)
  VALUES ('AGI');
INSERT INTO stats (name)
  VALUES ('XP');

INSERT INTO stat_types (name)
  VALUES ('Base');
INSERT INTO stat_types (name)
  VALUES ('Max');
INSERT INTO stat_types (name)
  VALUES ('PE');
INSERT INTO stat_types (name)
  VALUES ('Current');

-- Skill types
INSERT INTO skill_types (name)
  VALUES ('Attack');
INSERT INTO skill_types (name)
  VALUES ('Opening');
INSERT INTO skill_types (name)
  VALUES ('Defensive');

-- Skill patterns
INSERT INTO skill_patterns (name)
  VALUES ('Sweeping');
INSERT INTO skill_patterns (name)
  VALUES ('AoE');
INSERT INTO skill_patterns (name)
  VALUES ('Multi-Attack');
INSERT INTO skill_patterns (name)
  VALUES ('Single-Attack');
INSERT INTO skill_patterns (name)
  VALUES ('Fork-Attack');
INSERT INTO skill_patterns (name)
  VALUES ('Varies');

-- Event types
INSERT INTO event_types (name)
  VALUES ('PvP');
INSERT INTO event_types (name)
  VALUES ('Special Dungeons');
INSERT INTO event_types (name)
  VALUES ('World Battle Coliseum');
INSERT INTO event_types (name)
  VALUES ('Raid');

-- Raid Boss Types
INSERT INTO raid_boss_types (name)
  VALUES ('Regular Boss');
INSERT INTO raid_boss_types (name)
  VALUES ('Shadow Boss');
INSERT INTO raid_boss_types (name)
  VALUES ('Super Raid Boss');

-- Attack Types
INSERT INTO attack_types (name)
  VALUES ('Standard');
INSERT INTO attack_types (name)
  VALUES ('All-Out');

-- Brigade Types
INSERT INTO brigade_formations (name, num_positions)
  VALUES ('3-Skein', 3); -- 1
INSERT INTO brigade_formations (name, num_positions)
  VALUES ('3-Valley', 3); -- 2
INSERT INTO brigade_formations (name, num_positions)
  VALUES ('3-Tooth', 3); -- 3
INSERT INTO brigade_formations (name, num_positions)
  VALUES ('3-Wave', 3); -- 4

INSERT INTO brigade_formations (name, num_positions)
  VALUES ('4-Skein', 4); -- 5
INSERT INTO brigade_formations (name, num_positions)
  VALUES ('4-Valley', 4); -- 6
INSERT INTO brigade_formations (name, num_positions)
  VALUES ('4-Wave', 4); -- 7
INSERT INTO brigade_formations (name, num_positions)
  VALUES ('4-Front', 4); -- 8
INSERT INTO brigade_formations (name, num_positions)
  VALUES ('4-Mid', 4); -- 9
INSERT INTO brigade_formations (name, num_positions)
  VALUES ('4-Rear', 4); -- 10

INSERT INTO brigade_formations (name, num_positions)
  VALUES ('5-Skein', 5); -- 11
INSERT INTO brigade_formations (name, num_positions)
  VALUES ('5-Valley', 5); -- 12
INSERT INTO brigade_formations (name, num_positions)
  VALUES ('5-Tooth', 5); -- 13
INSERT INTO brigade_formations (name, num_positions)
  VALUES ('5-Wave', 5); -- 14
INSERT INTO brigade_formations (name, num_positions)
  VALUES ('5-Front', 5); -- 15
INSERT INTO brigade_formations (name, num_positions)
  VALUES ('5-Mid', 5); -- 16
INSERT INTO brigade_formations (name, num_positions)
  VALUES ('5-Rear', 5); -- 17
INSERT INTO brigade_formations (name, num_positions)
  VALUES ('5-Pike', 5); -- 18
INSERT INTO brigade_formations (name, num_positions)
  VALUES ('5-Shield', 5); -- 19
INSERT INTO brigade_formations (name, num_positions)
  VALUES ('5-Pincer', 5); -- 20

-- Brigade Formation Horizontal Position Types
INSERT INTO brigade_formation_horizontal_position_types (name)
  VALUES ('Far Left');
INSERT INTO brigade_formation_horizontal_position_types (name)
  VALUES ('Mid Left');
INSERT INTO brigade_formation_horizontal_position_types (name)
  VALUES ('Middle');
INSERT INTO brigade_formation_horizontal_position_types (name)
  VALUES ('Mid Right');
INSERT INTO brigade_formation_horizontal_position_types (name)
  VALUES ('Far Right');

-- Brigade Formation Vertical Position Types
INSERT INTO brigade_formation_vertical_position_types (name, damage_dealt_modifier, damage_taken_modifier)
  VALUES ('Front', 1.20, 1.20);
INSERT INTO brigade_formation_vertical_position_types (name, damage_dealt_modifier, damage_taken_modifier)
  VALUES ('Center', 1.00, 1.00);
INSERT INTO brigade_formation_vertical_position_types (name, damage_dealt_modifier, damage_taken_modifier)
  VALUES ('Rear', 0.80, 0.80);

-- Brigade Formation Positions
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (1, 2, 2);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (1, 3, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (1, 4, 2);

INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (2, 2, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (2, 3, 2);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (2, 4, 1);

INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (3, 2, 3);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (3, 3, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (3, 4, 3);

INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (4, 2, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (4, 3, 3);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (4, 4, 1);

INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (5, 1, 2);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (5, 2, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (5, 3, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (5, 4, 2);

INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (6, 1, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (6, 2, 3);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (6, 3, 3);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (6, 4, 1);

INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (7, 1, 2);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (7, 2, 3);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (7, 3, 2);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (7, 4, 3);

INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (8, 1, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (8, 2, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (8, 3, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (8, 4, 1);

INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (9, 1, 2);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (9, 2, 2);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (9, 3, 2);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (9, 4, 2);

INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (10, 1, 3);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (10, 2, 3);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (10, 3, 3);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (10, 4, 3);

INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (11, 1, 3);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (11, 2, 2);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (11, 3, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (11, 4, 2);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (11, 5, 3);

INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (12, 1, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (12, 2, 2);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (12, 3, 3);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (12, 4, 2);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (12, 5, 1);

INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (13, 1, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (13, 2, 3);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (13, 3, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (13, 4, 3);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (13, 5, 1);

INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (14, 1, 3);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (14, 2, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (14, 3, 2);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (14, 4, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (14, 5, 3);

INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (15, 1, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (15, 2, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (15, 3, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (15, 4, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (15, 5, 1);

INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (16, 1, 2);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (16, 2, 2);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (16, 3, 2);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (16, 4, 2);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (16, 5, 2);

INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (17, 1, 3);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (17, 2, 3);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (17, 3, 3);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (17, 4, 3);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (17, 5, 3);

INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (18, 1, 3);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (18, 2, 3);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (18, 3, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (18, 4, 3);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (18, 5, 3);

INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (19, 1, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (19, 2, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (19, 3, 3);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (19, 4, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (19, 5, 1);

INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (20, 1, 3);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (20, 2, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (20, 3, 3);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (20, 4, 1);
INSERT INTO brigade_formation_positions (brigade_formation_id, horizontal_position_type_id, vertical_position_type_id)
  VALUES (20, 5, 3);

