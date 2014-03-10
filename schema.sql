-- -*- mode:sql product:SQLite -*-
-- (C-u C-c TAB)

PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;

CREATE TABLE races
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, --ASC,
  name NVARCHAR(100) NOT NULL,
  description NVARCHAR(1000) NOT NULL,

  UNIQUE (name) ON CONFLICT ABORT
);

INSERT INTO races (name, description)
  VALUES ('Paragon', 'The world is filled with angels, and the paragons who do their bidding.');
--.....

CREATE TABLE rarities
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name NVARCHAR(100) NOT NULL,
  rank SMALLINT NOT NULL, -- e.g., common = 1, uncommon = 2, hero = some high value
  description TEXT NULL,

  UNIQUE (name) ON CONFLICT ABORT
);

CREATE TABLE growths
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name NVARCHAR(100) NOT NULL,
  description TEXT NULL,

  UNIQUE (name) ON CONFLICT ABORT
);

CREATE TABLE familiar_types
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  bb_id INTEGER NULL, -- Blood Brother's ID value
  name TEXT NOT NULL,
  rarity_id INTEGER NOT NULL,
  num_stars SMALLINT NOT NULL,
  max_stars SMALLINT NOT NULL,
  growth_id INTEGER NOT NULL,
  worth INTEGER NOT NULL,
  race_id INTEGER NOT NULL,
  tradable SMALLINT NOT NULL, -- bit
  last_words TEXT NOT NULL,

  prev_evolution_id INTEGER NULL,
  next_evolution_id INTEGER NULL,

  UNIQUE (name) ON CONFLICT ABORT,
  CONSTRAINT FK__familiar_types__rarity FOREIGN KEY (rarity_id) REFERENCES rarities(id),
  CONSTRAINT FK__familiar_types__growth FOREIGN KEY (growth_id) REFERENCES growths(id),
  CONSTRAINT FK__familiar_types__race FOREIGN KEY (race_id) REFERENCES races(id),
  CONSTRAINT FK__familiar_types__prev_evolution FOREIGN KEY (prev_evolution_id) REFERENCES familiar_types(id),
  CONSTRAINT FK__familiar_types__next_evolution FOREIGN KEY (next_evolution_id) REFERENCES familiar_types(id)
);

CREATE TABLE stats
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NULL,

  UNIQUE (name) ON CONFLICT ABORT
);

CREATE TABLE skill_types
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NULL,

  UNIQUE (name) ON CONFLICT ABORT
);

CREATE TABLE skill_patterns
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NULL,

  UNIQUE (name) ON CONFLICT ABORT
);
-- http://bloodbrothersgame.wikia.com/wiki/Category:Skills
-- Sweeping, AoE, Multi-Attack, Single-Attack, Fork-Attack, Varies

CREATE TABLE skills
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NOT NULL,
  skill_type_id INTEGER NOT NULL,
  min_probability REAL NOT NULL,
  max_probability REAL NOT NULL,
  modifier REAL NULL,
  modifier_stat_id INTEGER NULL,
  flat_modifier TINYINT NULL, -- bit

  num_targets SMALLINT NULL,
  skill_pattern_id INTEGER NULL,
  rows_range INT NULL, -- bit-mask of which rows (front to back) can be affected
  columns_range INT NULL, -- bit-mask of which columns (left to right) can be affected

  skill_based TEXT NULL, -- e.g., "Physical Based Defense".  Needed?
  damage_reduction TEXT NULL, -- e.g., "Physical Wards".  Needed?
  foe_defensive_modifier_stat_id INTEGER NULL,

  ability TEXT NULL, -- e.g., "Take Damage & Counter".  Needed?
  ignores_position TINYINT NULL, -- bit

  UNIQUE (name) ON CONFLICT ABORT,
  FOREIGN KEY (skill_type_id) REFERENCES skill_types(id),
  FOREIGN KEY (modifier_stat_id) REFERENCES stats(id),
  FOREIGN KEY (skill_pattern_id) REFERENCES skill_patterns(id),
  FOREIGN KEY (foe_defensive_modifier_stat_id) REFERENCES stats(id)
);

-- If a skill affects a stat, they are related here
CREATE TABLE skill_affected_stats
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  skill_id INTEGER NOT NULL,
  stat_id INTEGER NOT NULL,
  rank TINYINT NULL, -- this might be irrelevant/unknowable
  affects_allies TINYINT NOT NULL, -- bit
  affects_foes TINYINT NOT NULL, -- bit
  -- If differen stats can be modified by different amounts
  -- by a single skill, this table will have to keep track
  -- of those different amounts here.

  UNIQUE (skill_id, stat_id) ON CONFLICT ABORT,
  FOREIGN KEY (skill_id) REFERENCES skills(id),
  FOREIGN KEY (stat_id) REFERENCES stats(id)
);

CREATE TABLE familiar_type_skills
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  familiar_type_id INTEGER NOT NULL,
  skill_id INTEGER NOT NULL,

  UNIQUE (familiar_type_id, skill_id) ON CONFLICT ABORT,
  FOREIGN KEY (familiar_type_id) REFERENCES familiar_types(id),
  FOREIGN KEY (skill_id) REFERENCES skills(id)
);

CREATE TABLE event_types
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NULL,

  UNIQUE (name) ON CONFLICT ABORT
);

CREATE TABLE events
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT NOT NULL,
  event_type_id INTEGER NOT NULL,
  date_started TEXT NULL,
  date_ended TEXT NULL,

  UNIQUE (name) ON CONFLICT ABORT,
  FOREIGN KEY (event_type_id) REFERENCES event_types(id)
);

CREATE TABLE event_elite_familiar_types
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  event_id INTEGER NOT NULL,
  familiar_type_id INTEGER NOT NULL,
  multiplier REAL NOT NULL,

  UNIQUE (event_id, familiar_type_id) ON CONFLICT ABORT,
  FOREIGN KEY (event_id) REFERENCES events(id),
  FOREIGN KEY (familiar_type_id) REFERENCES familiar_types(id)
);

CREATE TABLE raid_boss_types
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NULL,

  UNIQUE (name) ON CONFLICT ABORT
);

CREATE TABLE raid_boss_familiar_types
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT NULL,
  familiar_type_id INTEGER NULL,
  raid_boss_type_id INTEGER NOT NULL,
  event_id INTEGER NOT NULL,

  FOREIGN KEY (familiar_type_id) REFERENCES familiar_types(id),
  FOREIGN KEY (raid_boss_type_id) REFERENCES raid_boss_types(id),
  FOREIGN KEY (event_id) REFERENCES events(id)
);

CREATE TABLE raid_bosses
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  raid_boss_familiar_type INTEGER NOT NULL,

  level REAL NOT NULL,
  HP REAL NULL,
  attack_points REAL NULL,
  mvp_bonus_multiplier REAL NULL,
  jur_mvp_bonus_multiplier REAL NULL,

  UNIQUE (raid_boss_familiar_type, level) ON CONFLICT ABORT,
  FOREIGN KEY (raid_boss_familiar_type) REFERENCES raid_boss_familiar_types
);

-- "standard", "all-out"
CREATE TABLE attack_types
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NULL,

  UNIQUE (name) ON CONFLICT ABORT
);

CREATE TABLE raid_boss_brigade_attacks
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  raid_boss_id INTEGER NOT NULL,
  brigade_id INTEGER NULL,

  date TEXT NULL,
  attack_type_id INTEGER NOT NULL,
  starting_HP REAL NULL,
  ending_HP REAL NULL,
  damage REAL NULL,

  FOREIGN KEY (raid_boss_id) REFERENCES raid_bosses(id),
  FOREIGN KEY (brigade_id) REFERENCES brigades(id),
  FOREIGN KEY (attack_type_id) REFERENCES attack_types(id)
);

CREATE TABLE players
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT NOT NULL,
  created_date TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  -- last login?

  UNIQUE (name) ON CONFLICT ABORT
);

CREATE TABLE familiars
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  player_id INTEGER NULL,
  familiar_type_id INTEGER NOT NULL,
  owned TINYINT NOT NULL, -- bit

  level REAL NULL,
  hp REAL NULL,
  atk REAL NULL,
  def REAL NULL,
  wis REAL NULL,
  agi REAL NULL,
  exp REAL NULL,

  hp_crystals INTEGER NOT NULL DEFAULT 0,
  atk_crystals INTEGER NOT NULL DEFAULT 0,
  def_crystals INTEGER NOT NULL DEFAULT 0,
  wis_crystals INTEGER NOT NULL DEFAULT 0,
  agi_crystals INTEGER NOT NULL DEFAULT 0,

  roots_crystals INTEGER NULL,

  FOREIGN KEY (player_id) REFERENCES players(id),
  FOREIGN KEY (familiar_type_id) REFERENCES familiar_types(id)
);

CREATE TABLE familiar_skills
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  familiar_id INTEGER NOT NULL,
  skill_id INTEGER NOT NULL,
  level SMALLINT NOT NULL,
  exp SMALLINT NOT NULL,

  FOREIGN KEY (familiar_id) REFERENCES familiars(id),
  FOREIGN KEY (skill_id) REFERENCES skills(id)
);

CREATE TABLE item_types
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT NOT NULL,
  description TEXT NULL,

  UNIQUE (name) ON CONFLICT ABORT
);

CREATE TABLE items
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  item_type_id INTEGER NOT NULL,
  player_id INTEGER NULL,
  quantity_tradable SMALLINT NOT NULL DEFAULT 0,
  quantity_bloodbound SMALLINT NOT NULL DEFAULT 0,

  UNIQUE (item_type_id, player_id),
  FOREIGN KEY (item_type_id) REFERENCES item_types(id),
  FOREIGN KEY (player_id) REFERENCES players(id)
);

CREATE TABLE bazaar_offers
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  player_name TEXT NULL,
  date TEXT NULL,
  offered_familiar_id INTEGER NOT NULL,

  FOREIGN KEY (offered_familiar_id) REFERENCES familiars(id)
);

CREATE TABLE bazaar_offer_item_terms
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  bazaar_offer_id INTEGER NOT NULL,
  item_id INTEGER NOT NULL,
  quantity INTEGER NOT NULL DEFAULT 1,

  UNIQUE (bazaar_offer_id, item_id) ON CONFLICT ABORT,
  FOREIGN KEY (bazaar_offer_id) REFERENCES bazaar_offers(id),
  FOREIGN KEY (item_id) REFERENCES item_types(id)
);

CREATE TABLE bazaar_offer_familiar_type_terms
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  bazaar_offer_id INTEGER NOT NULL,
  familiar_type_id INTEGER NOT NULL,
  quantity INTEGER NOT NULL DEFAULT 1,

  UNIQUE (bazaar_offer_id, familiar_type_id) ON CONFLICT ABORT,
  FOREIGN KEY (bazaar_offer_id) REFERENCES bazaar_offers(id),
  FOREIGN KEY (familiar_type_id) REFERENCES familiar_types(id)
);

CREATE TABLE brigade_formations
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT NOT NULL,
  num_positions INTEGER NOT NULL,

  UNIQUE (name) ON CONFLICT ABORT
);

-- the position's horizonal location; left, right, etc.
CREATE TABLE brigade_formation_horizontal_position_types
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT NOT NULL,

  UNIQUE (name) ON CONFLICT ABORT
);

-- "front", "center", "rear"
CREATE TABLE brigade_formation_vertical_position_types
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name TEXT NOT NULL,

  UNIQUE (name) ON CONFLICT ABORT
);

CREATE TABLE brigade_formation_positions
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  brigade_formation_id INTEGER NOT NULL,
  horizontal_position_type_id INTEGER NOT NULL,
  vertical_position_type_id INTEGER NOT NULL,

  UNIQUE (brigade_formation_id, horizontal_position_type_id) ON CONFLICT ABORT,
  FOREIGN KEY (brigade_formation_id) REFERENCES brigade_formations(id),
  FOREIGN KEY (horizontal_position_type_id) REFERENCES brigade_formation_horizontal_position_types(id),
  FOREIGN KEY (vertical_position_type_id) REFERENCES brigade_formation_vertical_position_types(id)
);

CREATE TABLE brigades
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  brigade_formation_id INTEGER NOT NULL,
  player_id INTEGER NULL,
  name TEXT NULL,
  notes TEXT NULL,

  UNIQUE (player_id, name) ON CONFLICT ABORT,
  FOREIGN KEY (brigade_formation_id) REFERENCES brigade_formations(id),
  FOREIGN KEY (player_id) REFERENCES players(id)
);

CREATE TABLE brigade_familiars
(
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  brigade_id INTEGER NOT NULL,
  familiar_id INTEGER NOT NULL,
  brigade_formation_position_id INTEGER NOT NULL,
  is_reserve TINYINT NOT NULL, -- bit

  UNIQUE (brigade_id, brigade_formation_position_id, is_reserve) ON CONFLICT ABORT,
  FOREIGN KEY (brigade_id) REFERENCES brigades(id),
  FOREIGN KEY (familiar_id) REFERENCES familiars(id),
  FOREIGN KEY (brigade_formation_position_id) REFERENCES brigade_formation_positions(id)
);

COMMIT;

-- evolution (rarity + stars)
