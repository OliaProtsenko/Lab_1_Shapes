enum ShapeType{
  triangle,
  quadrangle,
  circle,
  ellipsis,
}
 extension ShapeTypeExt on ShapeType{

  int countOfCoordinates(){
    switch(this){
      case ShapeType.triangle:
        return 3;
       case ShapeType.quadrangle:
         return 4;
       case ShapeType.ellipsis:
         return 1;
      case ShapeType.circle:
        return 3;
  }}
  String title(){
    switch(this){
      case ShapeType.triangle:
        return 'Triangle';
      case ShapeType.quadrangle:
        return 'Quadrangle';
      case ShapeType.ellipsis:
        return 'Ellipsis';
      case ShapeType.circle:
        return 'Circle';
    }
  }

 }