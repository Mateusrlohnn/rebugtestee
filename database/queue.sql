-- Fila ranqueada (:queue). Pode ser executado varias vezes sem duplicar nada.

CREATE TABLE IF NOT EXISTS `queue_ranking` (
  `player_id` int(11) NOT NULL,
  `tier` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `division` tinyint(3) unsigned NOT NULL DEFAULT 4,
  `league_points` int(11) NOT NULL DEFAULT 0,
  `mmr` int(11) NOT NULL DEFAULT 1000,
  `wins` int(11) NOT NULL DEFAULT 0,
  `losses` int(11) NOT NULL DEFAULT 0,
  `draws` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`player_id`),
  KEY `ranking_order` (`tier`, `division`, `league_points`, `mmr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `permission_commands` (`command_id`, `minimum_rank`, `vip_only`, `rights_only`, `rights_override`)
SELECT 'queue_command', 1, '0', '0', 'NONE'
WHERE NOT EXISTS (SELECT 1 FROM `permission_commands` WHERE `command_id` = 'queue_command');
