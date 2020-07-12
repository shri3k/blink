#include <avr/io.h>
#include <util/delay.h>

int main() {

  DDRB = 0x01<<4;
  while (1) {
    PORTB |= (0x01<<4);
    _delay_ms(1000);
    PORTB &= ~(0x01<<4);
    _delay_ms(1000);
  }
}
