//#define F_CPU 16000000UL
//#include <stdio.h>
//#include <util/delay.h>
//#include <avr/io.h>

#define data_pin 0
#define enable_pin 1
#define latch_pin 2
#define clk_pin 3

#define ENABLE	PORTC &= ~(1<<enable_pin)
#define DISABLE PORTC |=  (1<<enable_pin)

#define DATA_HIGH PORTC |=  (1<<data_pin)
#define DATA_LOW  PORTC &= ~(1<<data_pin)

#define LATCH_HIGH PORTC |=  (1<<latch_pin)
#define LATCH_LOW  PORTC &= ~(1<<latch_pin)

#define CLK_HIGH PORTC |=  (1<<clk_pin)
#define CLK_LOW  PORTC &= ~(1<<clk_pin)

#define LED_PB5_PIN 5

#define LED_PB5_OFF	PORTB &= ~(1<<LED_PB5_PIN)
#define LED_PB5_ON  PORTB |=  (1<<LED_PB5_PIN)

void setup() {
  Serial.begin(9600);
  Serial.println("start~");
  led_init();
  HC595_init();

}

void loop(){
  LED_PB5_ON;
  HC595_send_byte(0b00000000);
  HC595_latch();
  _delay_ms(1000);
  LED_PB5_OFF;
  HC595_send_byte(0b11111111);
  HC595_latch();
  _delay_ms(1000);
}

uint8_t LED_BAR_ARRAY[12][2]={0};

void LED_BAR_GRAPH(uint8_t red, uint8_t green)
{
  in
  for(int)

}

void led_init()
{
    DDRB |=  (1<<LED_PB5_PIN); // PB5 GPIO WRITE MODE
}
void HC595_init()
{
		DDRC  = 0b00000010;  //  only Enable pin write mode
		PORTC = 0b00000010; //  disable device
		DDRC  = 0b00001111;  //  data,enable,latch,clk pin write mode
		PORTC = 0b00000010; //  initial state
		
		int init_cnt=0;
		for(init_cnt=0;init_cnt<3;init_cnt++)
		{
				HC595_send_byte(0);
		}
		LATCH_HIGH;
		_delay_loop_1(5);
		LATCH_LOW;
		_delay_ms(1);
		ENABLE;
		DATA_LOW;
		LATCH_LOW;
		CLK_LOW;
		_delay_ms(1);
}
void HC595_send_byte(uint8_t data)
{
	uint8_t temp1	=	0;
	uint8_t i		=	0;
	
	for(i=0;i<8;i++)
	{
		CLK_LOW;
		temp1=data & 0b00000001;
		if(temp1)
		DATA_HIGH;
		else
		DATA_LOW;
		CLK_HIGH;
		data= data >> 1;
	}
	CLK_LOW;
	_delay_loop_1(1);
}
void HC595_latch()
{
  LATCH_HIGH;
	_delay_loop_1(5);
	LATCH_LOW;
}