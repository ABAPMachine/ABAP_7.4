*&---------------------------------------------------------------------*
*& Report  ZMESHES
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zmeshes.

TYPES: BEGIN OF t_manager,
         name_m   TYPE char10,
         salary TYPE int4,
       END OF t_manager,
       tt_manager TYPE SORTED TABLE OF t_manager WITH UNIQUE KEY name_m.

TYPES: BEGIN OF t_developer,
         name    TYPE char10,
         salary  TYPE int4,
         manager_d TYPE char10,
       END OF t_developer,
       tt_developer TYPE SORTED TABLE OF t_developer WITH UNIQUE KEY name.

TYPES: BEGIN OF MESH t_team,
         managers   TYPE tt_manager
             ASSOCIATION my_employee TO developers ON manager_d = name_m,
         developers TYPE tt_developer
           ASSOCIATION my_manager TO managers ON name_m = manager_d,
       END OF MESH t_team.

DATA: lt_developer TYPE tt_developer,
      lt_manager   TYPE tt_manager.

DATA: ls_team TYPE t_team.

DATA(jerry)  = VALUE t_developer( name = 'Jerry' salary = 1000 manager_d = 'Jason' ).
DATA(tom)    = VALUE t_developer( name = 'Tom' salary = 2000 manager_d = 'Jason' ).
DATA(bob)    = VALUE t_developer( name = 'Bob' salary = 2100 manager_d = 'Jason' ).
DATA(jack)   = VALUE t_developer( name = 'Jack' salary = 1000 manager_d = 'Thomas' ).
DATA(david)  = VALUE t_developer( name = 'David' salary = 2000 manager_d = 'Thomas' ).
DATA(john)   = VALUE t_developer( name = 'John' salary = 2100 manager_d = 'Thomas' ).
DATA(jason)  = VALUE t_manager( name_m = 'Jason' salary = 3000 ).
DATA(thomas) = VALUE t_manager( name_m = 'Thomas' salary = 3200 ).

INSERT jerry  INTO TABLE lt_developer.
INSERT tom    INTO TABLE lt_developer.
INSERT bob    INTO TABLE lt_developer.
INSERT jack   INTO TABLE lt_developer.
INSERT david  INTO TABLE lt_developer.
INSERT john   INTO TABLE lt_developer.
INSERT jason  INTO TABLE lt_manager.
INSERT thomas INTO TABLE lt_manager.

ls_team-developers = lt_developer.
ls_team-managers = lt_manager.

WRITE:/ |Jerry manager name: { ls_team-developers\my_manager[ jerry ]-name_m } |.

SKIP.

LOOP AT ls_team-managers\my_employee[ thomas ] ASSIGNING FIELD-SYMBOL(<employee>).
  WRITE:/ |Thomas employee name: { <employee>-name } |.
ENDLOOP.
