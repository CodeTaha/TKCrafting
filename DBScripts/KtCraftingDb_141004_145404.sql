-- Group [Group]
create table `group` (
   `oid`  integer  not null,
   `groupname`  varchar(255),
  primary key (`oid`)
);


-- Module [Module]
create table `module` (
   `oid`  integer  not null,
   `moduleid`  varchar(255),
   `modulename`  varchar(255),
  primary key (`oid`)
);


-- User [User]
create table `user` (
   `oid`  integer  not null,
   `username`  varchar(255),
   `password`  varchar(255),
   `email`  varchar(255),
  primary key (`oid`)
);


-- Task [ent1]
create table `task` (
   `task_id`  integer  not null,
   `title`  varchar(255),
   `description`  varchar(255),
   `monetaryreward`  integer,
   `maxexectime`  date,
   `expirationtime`  datetime,
  primary key (`task_id`)
);


-- Worker [ent2]
create table `worker` (
   `user_oid`  integer  not null,
   `name`  varchar(255),
   `birthdate`  date,
   `bank`  integer,
   `accuracy`  double precision,
   `assessedtasks`  integer,
  primary key (`user_oid`)
);


-- Item [ent3]
create table `item` (
   `item_id`  integer  not null,
   `title`  varchar(255),
   `caption`  varchar(255),
   `url`  varchar(255),
  primary key (`item_id`)
);


-- Annotation [ent4]
create table `annotation` (
   `annotation_id`  integer  not null,
   `label`  varchar(255),
   `confidencevalue`  integer,
  primary key (`annotation_id`)
);


-- AnnotationCampaign [ent5]
create table `annotationcampaign` (
   `ac_id`  integer  not null,
   `name`  varchar(255),
   `budget`  varchar(255),
   `status`  bit,
  primary key (`ac_id`)
);


-- Skills [ent6]
create table `skills` (
   `skill_id`  integer  not null,
   `name`  varchar(255),
  primary key (`skill_id`)
);


-- Group_DefaultModule [Group2DefaultModule_DefaultModule2Group]
alter table `group`  add column  `module_oid`  integer;


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid`  integer not null,
   `module_oid`  integer not null,
  primary key (`group_oid`, `module_oid`)
);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_oid`  integer;


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `user_oid`  integer not null,
   `group_oid`  integer not null,
  primary key (`user_oid`, `group_oid`)
);


-- Task_Worker [rel1]
create table `task_worker` (
   `task_task_id`  integer not null,
   `worker_oid`  integer not null,
  primary key (`task_task_id`, `worker_oid`)
);


-- Task_Item [rel3]
create table `task_item` (
   `task_task_id`  integer not null,
   `item_item_id`  integer not null,
  primary key (`task_task_id`, `item_item_id`)
);


-- Worker_Skills [rel4]
create table `worker_skills` (
   `worker_oid`  integer not null,
   `skills_skill_id`  integer not null,
  primary key (`worker_oid`, `skills_skill_id`)
);


-- AnnotationCampaign_Task [rel5]
alter table `task`  add column  `annotationcampaign_ac_id`  integer;


-- AnnotationCampaign_Item [rel6]
alter table `item`  add column  `annotationcampaign_ac_id`  integer;


-- Item_Annotation [rel7]
alter table `annotation`  add column  `item_item_id`  integer;


-- Worker_Annotation [rel8]
create table `worker_annotation` (
   `worker_oid`  integer not null,
   `annotation_annotation_id`  integer not null,
  primary key (`worker_oid`, `annotation_annotation_id`)
);


