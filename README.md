cg_erp
======

A SAAS College ERP application with support for multitenancy.


This is a scaffold application, which mainly concentrates on how to create a Multitenant Application to deploy on cloud services.

When the user creates a college, a new schema will be created with the sub domain name the user chosen.

Eg:
 URL: localhost:3000/colleges/new

 Create a new college, with subdomain name as "mahendra".

 Now, a schema with namespace as "mahendra" will be created and students from that college can access thier details with URL like

 mahendra.cgerp.com:3000/students


Database Population Commands:


1. publick schema migrate

   rake db:migrate

2. client scehma migrate commands

   rake db:schema_migrate
   rake db:schema_rollback STEP=1