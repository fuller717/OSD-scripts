            SET    0.1,1,0         ;Get rate & scaling OK

            VAR    V1,pdur         ;pulse duration ticks
            VAR    V2,ipi          ;interpulse interval ticks
            VAR    V3,np           ;nr. pulses per train
            VAR    V4,digits       ;variable determines DIGOUT bit pattern
            VAR    V5,loopC        ;loop counter
            VAR    V6,pdur1        ;pulse duration ticks
            VAR    V7,ipi1         ;interpulse interval ticks
            VAR    V8,np1          ;nr. pulses per train
            VAR    V11,pdur2       ;pulse duration ticks
            VAR    V12,ipi2        ;interpulse interval ticks
            VAR    V13,np2         ;nr. pulses per train
            VAR    V16,pdur3       ;pulse duration ticks
            VAR    V17,ipi3        ;interpulse interval ticks
            VAR    V18,np3         ;nr. pulses per train
            VAR    V21,pdur4       ;pulse duration ticks
            VAR    V22,ipi4        ;interpulse interval ticks
            VAR    V23,np4         ;nr. pulses per train


E0:     'x  DIGOUT [....0000]
            DELAY  s(0.05)-1
            BRAND  EA,0.2          ;Branch on random value (percent)
            DELAY  s(0.007)-1
            BRAND  EB,0.25         ;Branch on random value (percent)
            DELAY  s(0.009)-1
            BRAND  EC,0.33333      ;Branch on random value (percent)
            DELAY  s(0.009)-1
            BRAND  ED,0.5
            DELAY  s(0.009)-1
            JUMP   EE              ;Branch to new location
            DELAY  s(0.019)-1
            JUMP   EZ              ;Loop back forever

EA:     'a  MOV    loopC,np        ;Set section loop count
            MARK   20
LA:         DIGOUT digits
            DELAY  pdur
            DIGOUT [....0000]
                         ; Generate digital marker
            DELAY  ipi
            DBNZ   loopC,LA        ;Repeat required times
            JUMP   EZ
EB:     'b  MOV    loopC,np1       ;Set section loop count
            MARK   10
LB:         DIGOUT digits
            DELAY  pdur1
            DIGOUT [....0000]
                         ; Generate digital marker
            DELAY  ipi1
            DBNZ   loopC,LB        ;Repeat required times
            JUMP   EZ
EC:     'c  MOV    loopC,np2       ;Set section loop count
            MARK   5
LC:         DIGOUT digits
            DELAY  pdur2
            DIGOUT [....0000]
                         ; Generate digital marker
            DELAY  ipi2
            DBNZ   loopC,LC        ;Repeat required times
            JUMP   EZ
ED:     'd  MOV    loopC,np3       ;Set section loop count
            MARK   1
LD:         DIGOUT digits
            DELAY  pdur3
            DIGOUT [....0000]
                           ; Generate digital marker
            DELAY  ipi3
            DBNZ   loopC,LD        ;Repeat required times
            JUMP   EZ
EE:     'e  MOV    loopC,np4       ;Set section loop count
            MARK   2
LE:         DIGOUT digits
            DELAY  pdur4
            DIGOUT [....0000]
                      ; Generate digital marker
            DELAY  ipi4
            DBNZ   loopC,LE        ;Repeat required times
            JUMP   EZ

EZ:     'z  DIGOUT [....0000]
            HALT                   ;End of this sequence section