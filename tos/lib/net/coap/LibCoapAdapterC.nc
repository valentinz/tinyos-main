/*
 * Copyright (c) 2011 University of Bremen, TZI
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * - Redistributions of source code must retain the above copyright
 *   notice, this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the
 *   distribution.
 * - Neither the name of the copyright holders nor the names of
 *   its contributors may be used to endorse or promote products derived
 *   from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL
 * THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 */

generic configuration LibCoapAdapterC(const uint8_t num) {
#ifdef COAP_SERVER_ENABLED
  provides interface LibCoAP as LibCoapServer;
  uses interface UDP as UDPServer;
#endif

#ifdef COAP_CLIENT_ENABLED
  provides interface LibCoAP as LibCoapClient;
  uses interface UDP as UDPClient;
#endif
} implementation {
  components LibCoapAdapterP;

#ifdef COAP_SERVER_ENABLED
  LibCoapServer = LibCoapAdapterP.LibCoapServer[num];
  UDPServer = LibCoapAdapterP.UDPServer[num];
#endif

#ifdef COAP_CLIENT_ENABLED
  LibCoapClient = LibCoapAdapterP.LibCoapClient[num];
  UDPClient = LibCoapAdapterP.UDPClient[num];
#endif

  components LocalTimeSecondC;
  LibCoapAdapterP.LocalTime -> LocalTimeSecondC;

  components LedsC;
  LibCoapAdapterP.Leds -> LedsC;

  components RandomC;
  LibCoapAdapterP.Random -> RandomC;

  components new TimerMilliC();
  LibCoapAdapterP.RetransmissionTimerMilli -> TimerMilliC;

}
