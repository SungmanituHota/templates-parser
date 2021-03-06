------------------------------------------------------------------------------
--                             Templates Parser                             --
--                                                                          --
--                      Copyright (C) 2005-2012, AdaCore                    --
--                                                                          --
--  This is free software;  you can redistribute it  and/or modify it       --
--  under terms of the  GNU General Public License as published  by the     --
--  Free Software  Foundation;  either version 3,  or (at your option) any  --
--  later version.  This software is distributed in the hope  that it will  --
--  be useful, but WITHOUT ANY WARRANTY;  without even the implied warranty --
--  of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU     --
--  General Public License for  more details.                               --
--                                                                          --
--  You should have  received  a copy of the GNU General  Public  License   --
--  distributed  with  this  software;   see  file COPYING3.  If not, go    --
--  to http://www.gnu.org/licenses for a complete copy of the license.      --
------------------------------------------------------------------------------

with Ada.Text_IO;
with Templates_Parser;

procedure Include2 is

   use Ada.Text_IO;
   use Templates_Parser;

   TS : Translate_Set;

begin
   Insert (TS, Assoc ("ONE", "un"));
   Insert (TS, Assoc ("TWO", "deux"));
   Insert (TS, Assoc ("THREE", "trois"));

   Put_Line (Parse ("include2_main.tmplt", TS, Cached => True));
   Put_Line (Parse ("include2_main2.tmplt", TS, Cached => True));
end Include2;
