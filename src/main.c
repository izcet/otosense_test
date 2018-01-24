#include "otosense.h"

int     exit_and_close(int ret)
{
  Pa_terminate();
  return (ret);
}

int			main(int argc, char **argv)
{
  PaDeviceIndex   di;

  Pa_Initialize();
  di = Pa_GetDefaultInputDevice();
  if (di == paNoDevice)
    return (exit_and_close(1));



  (void)argc;
  (void)argv;
  return (exit_and_close(0));
}
