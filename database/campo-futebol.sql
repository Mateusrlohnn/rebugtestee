-- Campo de futebol do quarto "aaa" do Jogador1 (room_id 3).
-- Pode ser executado mais de uma vez: os moveis e as posicoes sao atualizados.

INSERT INTO `furniture`
(`id`,`item_name`,`public_name`,`type`,`width`,`length`,`stack_height`,`can_stack`,`can_sit`,`can_lay`,`is_walkable`,`sprite_id`,`allow_recycle`,`allow_trade`,`allow_marketplace_sell`,`allow_gift`,`allow_inventory_stack`,`interaction_type`,`interaction_modes_count`,`vending_ids`,`effect_id`,`is_arrow`,`foot_figure`,`stack_multiplier`,`subscriber`,`variable_heights`,`flat_id`,`revision`,`description`,`specialtype`,`canlayon`,`requires_rights`,`song_id`,`colors`,`deleteable`)
VALUES
(3498,'fball_ptch5','Gramado - circulo central','s',3,3,'0','1','0','0','1',3498,'1','1','0','1','1','default',1,'0',0,'0','0','0','0','0',5808,45554,'Circulo central do campo.',1,'0','1',0,NULL,1),
(3502,'fball_ptch8','Gramado liso','s',3,3,'0','1','0','0','1',3502,'1','1','0','1','1','default',1,'0',0,'0','0','0','0','0',5812,45554,'Parte lisa do gramado.',1,'0','1',0,NULL,1),
(3504,'fball_ptch4','Gramado - linha central','s',3,3,'0','1','0','0','1',3504,'1','1','0','1','1','default',1,'0',0,'0','0','0','0','0',5814,45554,'Linha central do campo.',1,'0','1',0,NULL,1),
(3509,'fball_ptch7','Gramado - grande area','s',3,3,'0','1','0','0','1',3509,'1','1','0','1','1','default',1,'0',0,'0','0','0','0','0',5819,45554,'Grande area do campo.',1,'0','1',0,NULL,1),
(3511,'fball_ptch2','Gramado - lateral','s',3,3,'0','1','0','0','1',3511,'1','1','0','1','1','default',1,'0',0,'0','0','0','0','0',5821,45554,'Linha lateral do campo.',1,'0','1',0,NULL,1),
(3513,'fball_ptch3','Gramado - lateral e meio','s',3,3,'0','1','0','0','1',3513,'1','1','0','1','1','default',1,'0',0,'0','0','0','0','0',5823,45554,'Encontro da lateral com a linha central.',1,'0','1',0,NULL,1),
(3517,'fball_ptch6','Gramado - meia-lua','s',3,3,'0','1','0','0','1',3517,'1','1','0','1','1','default',1,'0',0,'0','0','0','0','0',5827,45554,'Meia-lua da grande area.',1,'0','1',0,NULL,1),
(3520,'fball_ptch0','Gramado - canto','s',3,3,'0','1','0','0','1',3520,'1','1','0','1','1','default',1,'0',0,'0','0','0','0','0',5830,45554,'Canto do campo.',1,'0','1',0,NULL,1),
(3524,'fball_ptch1','Gramado - escanteio','s',3,3,'0','1','0','0','1',3524,'1','1','0','1','1','default',1,'0',0,'0','0','0','0','0',5834,45554,'Canto com marca de escanteio.',1,'0','1',0,NULL,1)
ON DUPLICATE KEY UPDATE
`item_name`=VALUES(`item_name`),`public_name`=VALUES(`public_name`),`width`=VALUES(`width`),`length`=VALUES(`length`),
`stack_height`=VALUES(`stack_height`),`can_sit`=VALUES(`can_sit`),`is_walkable`=VALUES(`is_walkable`),
`sprite_id`=VALUES(`sprite_id`),`interaction_type`=VALUES(`interaction_type`),`flat_id`=VALUES(`flat_id`),
`description`=VALUES(`description`);

-- Mantem a bola Rebug existente e centraliza no campo.
UPDATE `items` SET `x`=8,`y`=13,`z`=0,`rot`=0,`extra_data`='0' WHERE `id`=79;

DELETE FROM `items` WHERE `id` BETWEEN 1000 AND 1036;
INSERT INTO `items` (`id`,`user_id`,`room_id`,`base_item`,`extra_data`,`x`,`y`,`z`,`rot`,`wall_pos`,`limited_data`) VALUES
-- Fundo superior e grande area
(1000,3,3,3524,'0',4,3,0,0,'','0:0'),
(1001,3,3,3509,'0',7,3,0,0,'','0:0'),
(1002,3,3,3524,'0',10,3,0,2,'','0:0'),
-- Faixa livre superior
(1003,3,3,3511,'0',4,6,0,0,'','0:0'),
(1004,3,3,3502,'0',7,6,0,0,'','0:0'),
(1005,3,3,3511,'0',10,6,0,4,'','0:0'),
-- Meia-lua superior
(1006,3,3,3511,'0',4,9,0,0,'','0:0'),
(1007,3,3,3517,'0',7,9,0,0,'','0:0'),
(1008,3,3,3511,'0',10,9,0,4,'','0:0'),
-- Meio de campo
(1009,3,3,3513,'0',4,12,0,0,'','0:0'),
(1010,3,3,3498,'0',7,12,0,0,'','0:0'),
(1011,3,3,3513,'0',10,12,0,4,'','0:0'),
-- Meia-lua inferior
(1012,3,3,3511,'0',4,15,0,0,'','0:0'),
(1013,3,3,3517,'0',7,15,0,4,'','0:0'),
(1014,3,3,3511,'0',10,15,0,4,'','0:0'),
-- Faixa livre inferior
(1015,3,3,3511,'0',4,18,0,0,'','0:0'),
(1016,3,3,3502,'0',7,18,0,0,'','0:0'),
(1017,3,3,3511,'0',10,18,0,4,'','0:0'),
-- Fundo inferior e grande area
(1018,3,3,3524,'0',4,21,0,6,'','0:0'),
(1019,3,3,3509,'0',7,21,0,4,'','0:0'),
(1020,3,3,3524,'0',10,21,0,4,'','0:0');

UPDATE `rooms`
SET `allow_walkthrough`='0', `processing_type`=3, `trade_state`='DISABLED'
WHERE `id`=3;
