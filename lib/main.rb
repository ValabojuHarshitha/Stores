module Main
MAIN_VAR = "mainvar"
  def Main.rubyteam
     puts "ruby team is total 5"
  end

   module Innermain
     INNERVAR='innervar'
     def Innermain.phpteam
       puts "iam php"
     end
   end

   class Maincl
     def cl1
     puts MAIN_VAR
     end
   end
end

 class Second
   include Main
   include Innermain
   def secone
     puts 'secone'
     puts INNERVAR
   end
 end

 puts Main::Maincl.new.cl1
 puts Main::Innermain.phpteam
 puts Second.new.secone
 