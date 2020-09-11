            SET    0.1,1,0         ;Get rate & scaling OK

            VAR    V1,pdur         ;pulse duration ticks
            VAR    V2,ipi          ;interpulse interval ticks
            VAR    V3,np           ;nr. pulses per train
            VAR    V4,digits       ;variable determines DIGOUT bit pattern
            VAR    V5,loopC        ;loop counter


E0:     'z  DIGOUT [....0000]
            HALT                   ;End of this sequence section

EA:     'x  MOV    loopC,np    ;Set section loop count
LA:         DIGOUT digits