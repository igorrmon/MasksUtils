
def IsEmail(args):
  x = str(args)
  atpos = x.find("@");
  dotpos = x.find(".");
  if (atpos < 1 or dotpos < atpos + 2 ):
     return False;

  return True;
