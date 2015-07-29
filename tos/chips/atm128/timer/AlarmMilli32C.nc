generic configuration AlarmMilli32C()
{
  provides interface Alarm<TMilli,uint32_t>;
}
implementation
{
  components new AlarmOne16C() as AlarmFrom;
  components CounterMilli32C as Counter;
  components new TransformAlarmC(TMilli,uint32_t,TOne,uint16_t,0) as Transform;

  Alarm = Transform;

  Transform.AlarmFrom -> AlarmFrom;
  Transform.Counter -> Counter;
}
