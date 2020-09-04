
#Valida se o email esta em um formato válido
 
def IsEmail(args):
  x = str(args)
  atpos = x.find("@");
  dotpos = x.find(".");
  if (atpos < 1 or dotpos < atpos + 2 ):
     pass;
  else:
     return True;

#convert from 99999999999 to 999.999.999-99
def CpfMask(args):
   x = str(args)
   if len(x) == 11:
      x = x.zfill(11)
      cpf = '{}.{}.{}-{}'.format(x[:3], x[3:6], x[6:9], x[9:])
      return cpf
   else:
      pass
