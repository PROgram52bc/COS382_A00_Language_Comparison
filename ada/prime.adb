with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_text_IO; use Ada.Integer_Text_IO;

procedure Prime is
  N : Integer;
  type PrimeList is array (Positive range <>) of Integer;
  Arr: PrimeList ( 1 .. 0 ) := (others => 0);

  function IsPrime (N : Integer) return Boolean is
  begin
    if N <= 1 then
      return False;
    end if;

    for I in 2 .. N/2 loop
      if N mod I = 0 then
        return False;
      end if;
    end loop;
    return True;

  end IsPrime;

  procedure PrimePartitions (n : Integer; k : Integer; lst: PrimeList; lstSize: Integer) is
  begin
    if n = 0 then
      for I in 1 .. (lstSize) loop
        Put (lst(I), width => 0);
        if I < (lstSize) then
          Put (" + ");
        end if;
      end loop;
      Put_Line("");
    elsif n > k then
      for I in k+1 .. n loop
        if IsPrime(I) then
          PrimePartitions(n-I, I, lst & (I), lstSize+1);
        end if;
      end loop;
    end if;
  end PrimePartitions;


begin
  Put_Line ("Ada Prime Partitions Program");
  Put ("Enter a number: ");
  Get(N);
  PrimePartitions(N, 1, Arr, 0);
end Prime;
