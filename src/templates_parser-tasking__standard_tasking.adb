------------------------------------------------------------------------------
--                             Templates Parser                             --
--                                                                          --
--                            Copyright (C) 2005                            --
--                                 AdaCore                                  --
--                                                                          --
--  This library is free software; you can redistribute it and/or modify    --
--  it under the terms of the GNU General Public License as published by    --
--  the Free Software Foundation; either version 2 of the License, or (at   --
--  your option) any later version.                                         --
--                                                                          --
--  This library is distributed in the hope that it will be useful, but     --
--  WITHOUT ANY WARRANTY; without even the implied warranty of              --
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU       --
--  General Public License for more details.                                --
--                                                                          --
--  You should have received a copy of the GNU General Public License       --
--  along with this library; if not, write to the Free Software Foundation, --
--  Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.          --
--                                                                          --
--  As a special exception, if other files instantiate generics from this   --
--  unit, or you link this unit with other files to produce an executable,  --
--  this  unit  does not  by itself cause  the resulting executable to be   --
--  covered by the GNU General Public License. This exception does not      --
--  however invalidate any other reasons why the executable file  might be  --
--  covered by the  GNU Public License.                                     --
------------------------------------------------------------------------------

--  $Id$

package body Templates_Parser.Tasking is

   --  Simple semaphore

   protected Semaphore is
      entry Lock;
      entry Unlock;
   private
      Locked : Boolean := False;
   end Semaphore;

   ----------
   -- Lock --
   ----------

   procedure Lock is
   begin
      Semaphore.Lock;
   end Lock;

   ---------------
   -- Semaphore --
   ---------------

   protected body Semaphore is

      ----------
      -- Lock --
      ----------

      entry Lock when not Locked is
      begin
         Locked := True;
      end Lock;

      ------------
      -- Unlock --
      ------------

      entry Unlock when Locked is
      begin
         Locked := False;
      end Unlock;

   end Semaphore;

   ------------
   -- Unlock --
   ------------

   procedure Unlock is
   begin
      Semaphore.Unlock;
   end Unlock;

end Templates_Parser.Tasking;
