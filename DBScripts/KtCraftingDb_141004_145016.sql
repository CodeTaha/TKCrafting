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
   `worker_id`  integer  not null,
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
alter table `group`   add index fk_group_module (`module_oid`), add constraint fk_group_module foreign key (`module_oid`) references `module` (`oid`);


-- Group_Module [Group2Module_Module2Group]
create table `group_module` (
   `group_oid`  integer not null,
   `module_oid`  integer not null,
  primary key (`group_oid`, `module_oid`)
);
alter table `group_module`   add index fk_group_module_group (`group_oid`), add constraint fk_group_module_group foreign key (`group_oid`) references `group` (`oid`);
alter table `group_module`   add index fk_group_module_module (`module_oid`), add constraint fk_group_module_module foreign key (`module_oid`) references `module` (`oid`);


-- User_DefaultGroup [User2DefaultGroup_DefaultGroup2User]
alter table `user`  add column  `group_oid`  integer;
alter table `user`   add index fk_user_group (`group_oid`), add constraint fk_user_group foreign key (`group_oid`) references `group` (`oid`);


-- User_Group [User2Group_Group2User]
create table `user_group` (
   `user_oid`  integer not null,
   `group_oid`  integer not null,
  primary key (`user_oid`, `group_oid`)
);
alter table `user_group`   add index fk_user_group_user (`user_oid`), add constraint fk_user_group_user foreign key (`user_oid`) references `user` (`oid`);
alter table `user_group`   add index fk_user_group_group (`group_oid`), add constraint fk_user_group_group foreign key (`group_oid`) references `group` (`oid`);


-- Task_Worker [rel1]
create table `task_worker` (
   `task_task_id`  integer not null,
   `worker_worker_id`  integer not null,
  primary key (`task_task_id`, `worker_worker_id`)
);
alter table `task_worker`   add index fk_task_worker_task (`task_task_id`), add constraint fk_task_worker_task foreign key (`task_task_id`) references `task` (`task_id`);
alter table `task_worker`   add index fk_task_worker_worker (`worker_worker_id`), add constraint fk_task_worker_worker foreign key (`worker_worker_id`) references `worker` ();


-- Task_Item [rel3]
create table `task_item` (
   `task_task_id`  integer not null,
   `item_item_id`  integer not null,
  primary key (`task_task_id`, `item_item_id`)
);
alter table `task_item`   add index fk_task_item_task (`task_task_id`), add constraint fk_task_item_task foreign key (`task_task_id`) references `task` (`task_id`);
alter table `task_item`   add index fk_task_item_item (`item_item_id`), add constraint fk_task_item_item foreign key (`item_item_id`) references `item` (`item_id`);


-- Worker_Skills [rel4]
create table `worker_skills` (
   `worker_worker_id`  integer not null,
   `skills_skill_id`  integer not null,
  primary key (`worker_worker_id`, `skills_skill_id`)
);
alter table `worker_skills`   add index fk_worker_skills_worker (`worker_worker_id`), add constraint fk_worker_skills_worker foreign key (`worker_worker_id`) references `worker` ();
alter table `worker_skills`   add index fk_worker_skills_skills (`skills_skill_id`), add constraint fk_worker_skills_skills foreign key (`skills_skill_id`) references `skills` (`skill_id`);


-- AnnotationCampaign_Task [rel5]
alter table `task`  add column  `annotationcampaign_ac_id`  integer;
alter table `task`   add index fk_task_annotationcampaign (`annotationcampaign_ac_id`), add constraint fk_task_annotationcampaign foreign key (`annotationcampaign_ac_id`) references `annotationcampaign` (`ac_id`);


-- AnnotationCampaign_Item [rel6]
alter table `item`  add column  `annotationcampaign_ac_id`  integer;
alter table `item`   add index fk_item_annotationcampaign (`annotationcampaign_ac_id`), add constraint fk_item_annotationcampaign foreign key (`annotationcampaign_ac_id`) references `annotationcampaign` (`ac_id`);


-- Item_Annotation [rel7]
alter table `annotation`  add column  `item_item_id`  integer;
alter table `annotation`   add index fk_annotation_item (`item_item_id`), add constraint fk_annotation_item foreign key (`item_item_id`) references `item` (`item_id`);


-- Worker_Annotation [rel8]
create table `worker_annotation` (
   `worker_worker_id`  integer not null,
   `annotation_annotation_id`  integer not null,
  primary key (`worker_worker_id`, `annotation_annotation_id`)
);
alter table `worker_annotation`   add index fk_worker_annotation_worker (`worker_worker_id`), add constraint fk_worker_annotation_worker foreign key (`worker_worker_id`) references `worker` ();
alter table `worker_annotation`   add index fk_worker_annotation_annotatio (`annotation_annotation_id`), add constraint fk_worker_annotation_annotatio foreign key (`annotation_annotation_id`) references `annotation` (`annotation_id`);


-- GEN FK: Worker --> User
alter table `worker`   add index fk_worker_user (`user_oid`), add constraint fk_worker_user foreign key (`user_oid`) references `user` (`oid`);


