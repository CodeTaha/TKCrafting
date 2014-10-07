-- GEN FK: Worker --> User
alter table `worker`   add index fk_worker_user (), add constraint fk_worker_user foreign key () references `user` ();


