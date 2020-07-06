
blink.hex: blink
	avr-objcopy -O ihex -R .eeprom blink blink.hex

upload: blink.hex
	avrdude -F -V -c arduino -p ATMEGA328p -P /dev/ttyACM0 -b 115200 -U flash:w:blink.hex

blink: blink.o
	avr-gcc -mmcu=atmega328p blink.o -o blink

blink.o: blink.c
	avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -c -o blink.o blink.c

clean:
	rm -rf blink blink.o blink.hex

.PHONY: clean
