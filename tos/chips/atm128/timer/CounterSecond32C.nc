configuration CounterSecond32C
{
  provides interface Counter<TSecond,uint32_t>;
} implementation {
  components CounterOne16C as CounterFrom;
  components new TransformCounterC(TSecond,uint32_t,TOne,uint16_t,0,uint32_t) as Transform;

  Counter = Transform.Counter;

  Transform.CounterFrom -> CounterFrom;
}
