class SpeedoState{
  int SpeedoValue;

  SpeedoState({required this.SpeedoValue});
}

class SpeedmeterState extends SpeedoState
{
  int speedmetervalue;

  SpeedmeterState( {required this.speedmetervalue}):super(SpeedoValue:0);

}