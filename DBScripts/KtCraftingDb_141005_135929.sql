-- Skills_Task [rel2]
create table `skills_task` (
   `skills_skill_id`  integer not null,
   `task_task_id`  integer not null,
  primary key (`skills_skill_id`, `task_task_id`)
);


